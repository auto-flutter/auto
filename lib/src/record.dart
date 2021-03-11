import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:archive/archive_io.dart';
import 'package:auto/protos/app_info.pb.dart';
import 'package:auto/protos/record.pbserver.dart';
import 'package:auto/protos/script_meta_data.pb.dart';
import 'package:fixnum/fixnum.dart';

import '../auto.dart';
import 'tar_key.dart';

class RecordTask {
  RecordTask(this._logFile, {Stream<String> logProvider}) {
    if (logProvider != null) {
      assert(logProvider.isBroadcast);
      cancel = logProvider.listen((String event) {
        addLog(event);
      });
    }
  }

  final Queue<MemoryRecord> _queue = Queue<MemoryRecord>();
  final List<Uint8List> snapshot = <Uint8List>[];
  int _prevTime = DateTime.now().microsecondsSinceEpoch;
  File _logFile;
  IOSink _logSink;
  StreamSubscription cancel;
  Duration totalTime = Duration.zero;

  void addDisableKeyboardEvent() {
    final delay = _nextDuration();
    totalTime += delay;
    _queue.add(MemoryRecord(RecordType.disableKeyboard, delay));
  }

  void addEnableKeyboardEvent() {
    final delay = _nextDuration();
    totalTime += delay;
    _queue.add(MemoryRecord(RecordType.enableKeyboard, delay));
  }

  void addPointerRecord(PointerDataPacket packet) {
    final delay = _nextDuration();
    totalTime += delay;
    _queue.add(MemoryRecord(RecordType.pointer, delay, pointer: packet));
  }

  void addDelay(Duration delay) {
    totalTime += delay;
    _queue.add(MemoryRecord(RecordType.delay, delay));
  }

  Future<void> addSnapshot() async {
    final delay = _nextDuration();
    totalTime += delay;
    _queue.add(MemoryRecord(RecordType.snapshot, delay));
    final screenshot = await takeScreenSnapshot();
    snapshot.add(screenshot);
  }

  void addSoftKeyboardRecord(ByteData data) {
    final delay = _nextDuration();
    totalTime += delay;
    _queue
        .add(MemoryRecord(RecordType.softKeyboard, delay, softKeyboard: data));
  }

  void addLog(String line) {
    _logSink ??= _logFile.openWrite();
    _logSink.writeln(line);
  }

  void stopTiming() {
    final delay = _nextDuration();
    totalTime += delay;
    addDelay(delay);
  }

  void startTiming() {
    _prevTime = DateTime.now().microsecondsSinceEpoch;
  }

  Future<void> close() async {
    await cancel?.cancel();
    await _logSink?.flush();
    await _logSink?.close();
  }

  Future<List<int>> save() async {
    await close();

    final tarEncoder = TarEncoder();
    OutputStream outputStream = OutputStream();
    tarEncoder.start(outputStream);

    //todo Use other methods to serialize
    RecordPacket recordPacket = RecordPacket();
    recordPacket.data.addAll(_queue.map((e) => memoryRecord2Record(e)));
    final data = recordPacket.writeToBuffer();
    UIAutomator.logger.info('write recordPacket: ${data.length}');
    tarEncoder.add(ArchiveFile(TarKey.recordStream, data.length, data));

    AppInfo appInfo = await UIAutomator.instance.getAppInfo();
    ScriptMetaData metaData = ScriptMetaData();
    metaData.appInfo = appInfo;
    metaData.totalTime = Int64(totalTime.inMicroseconds);
    UIAutomator.logger.info('write ScriptMetaData: $metaData');
    final metaDataBytes = metaData.writeToBuffer();
    tarEncoder.add(ArchiveFile(
        TarKey.scriptMetaData, metaDataBytes.length, metaDataBytes));

    if (_logSink != null && _logFile.existsSync()) {
      await _logSink.done;
      final logData = await _logFile.readAsBytes();
      UIAutomator.logger.info('write log file ${_logFile.path}: ${logData.length}');
      tarEncoder.add(ArchiveFile(TarKey.log, logData.length, logData));
    }

    for (int i = 0; i < snapshot.length; i++) {
      tarEncoder.add(ArchiveFile(
          '${TarKey.screenshotPrefix}$i', snapshot[i].length, snapshot[i]));
    }

    tarEncoder.finish();
    return outputStream.getBytes();
  }

  Iterator<MemoryRecord> get iterator {
    return _queue.iterator;
  }

  Duration _nextDuration() {
    final now = DateTime.now().microsecondsSinceEpoch;
    final d = Duration(microseconds: now - _prevTime);
    _prevTime = now;
    return d;
  }
}

Record memoryRecord2Record(MemoryRecord record) {
  Record result = Record();
  if (record.type == RecordType.pointer) {
    result.pointer.addAll(record.pointer.data.map((e) {
      PointerRecord pointerRecord = PointerRecord();
      pointerRecord.embedderId = Int64(e.embedderId);
      pointerRecord.timeStamp = Int64(e.timeStamp.inMicroseconds);
      pointerRecord.change = Int64(e.change.index);
      pointerRecord.kind = Int64(e.kind.index);
      if (e.signalKind != null) {
        pointerRecord.signalKind = Int64(e.signalKind.index);
      }
      pointerRecord.device = Int64(e.device);
      pointerRecord.pointerIdentifier = Int64(e.pointerIdentifier);
      pointerRecord.physicalX = e.physicalX;
      pointerRecord.physicalY = e.physicalY;
      pointerRecord.physicalDeltaX = e.physicalDeltaX;
      pointerRecord.physicalDeltaY = e.physicalDeltaY;
      pointerRecord.buttons = Int64(e.buttons);
      pointerRecord.platformData = Int64(e.platformData);
      pointerRecord.obscured = e.obscured;
      pointerRecord.synthesized = e.synthesized;
      pointerRecord.pressure = e.pressure;
      pointerRecord.pressureMin = e.pressureMin;
      pointerRecord.pressureMax = e.pressureMax;
      pointerRecord.distance = e.distance;
      pointerRecord.distanceMax = e.distanceMax;
      pointerRecord.size = e.size;
      pointerRecord.radiusMajor = e.radiusMajor;
      pointerRecord.radiusMinor = e.radiusMinor;
      pointerRecord.radiusMin = e.radiusMin;
      pointerRecord.radiusMax = e.radiusMax;
      pointerRecord.orientation = e.orientation;
      pointerRecord.tilt = e.tilt;
      pointerRecord.scrollDeltaX = e.scrollDeltaX;
      pointerRecord.scrollDeltaY = e.scrollDeltaY;

      return pointerRecord;
    }));
  } else if (record.type == RecordType.softKeyboard) {
    final data = record.softKeyboard.buffer.asUint8List();
    result.softKeyboard = data;
  } else if (record.type == RecordType.delay ||
      record.type == RecordType.snapshot ||
      record.type == RecordType.enableKeyboard ||
      record.type == RecordType.disableKeyboard) {}

  result.type = record.type;
  result.delay = Int64(record.delay.inMicroseconds);

  return result;
}

MemoryRecord record2MemoryRecord(Record record) {
  if (record.type == RecordType.pointer) {
    final pointer = PointerDataPacket(
        data: record.pointer.map((e) {
      PointerData data = PointerData(
        embedderId: e.embedderId.toInt(),
        timeStamp: Duration(microseconds: e.timeStamp.toInt()),
        change: PointerChange.values[e.change.toInt()],
        kind: PointerDeviceKind.values[e.kind.toInt()],
        signalKind: e.hasSignalKind()
            ? PointerSignalKind.values[e.signalKind.toInt()]
            : null,
        device: e.device.toInt(),
        pointerIdentifier: e.pointerIdentifier.toInt(),
        physicalX: e.physicalX,
        physicalY: e.physicalY,
        physicalDeltaX: e.physicalDeltaX,
        physicalDeltaY: e.physicalDeltaY,
        buttons: e.buttons.toInt(),
        obscured: e.obscured,
        synthesized: e.synthesized,
        pressure: e.pressure,
        pressureMin: e.pressureMin,
        pressureMax: e.pressureMax,
        distance: e.distance,
        distanceMax: e.distanceMax,
        size: e.size,
        radiusMajor: e.radiusMajor,
        radiusMinor: e.radiusMinor,
        radiusMin: e.radiusMin,
        radiusMax: e.radiusMax,
        orientation: e.orientation,
        tilt: e.tilt,
        platformData: e.platformData.toInt(),
        scrollDeltaX: e.scrollDeltaX,
        scrollDeltaY: e.scrollDeltaY,
      );

      return data;
    }).toList());
    return MemoryRecord(
        record.type, Duration(microseconds: record.delay.toInt()),
        pointer: pointer);
  } else if (record.type == RecordType.softKeyboard) {
    final softKeyboard =
        ByteData.sublistView(Uint8List.fromList(record.softKeyboard));
    return MemoryRecord(
        record.type, Duration(microseconds: record.delay.toInt()),
        softKeyboard: softKeyboard);
  } else if (record.type == RecordType.delay ||
      record.type == RecordType.snapshot ||
      record.type == RecordType.enableKeyboard ||
      record.type == RecordType.disableKeyboard) {
    return MemoryRecord(
        record.type, Duration(microseconds: record.delay.toInt()));
  } else {
    throw TypeError();
  }
}

class MemoryRecord {
  final RecordType type;
  final PointerDataPacket pointer;
  final ByteData softKeyboard;
  final Duration delay;

  MemoryRecord(this.type, this.delay, {this.pointer, this.softKeyboard});
}
