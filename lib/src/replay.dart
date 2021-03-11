import 'dart:async';
import 'dart:io';

import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:auto/auto.dart';
import 'package:auto/protos/app_info.pbserver.dart';

import 'tar_key.dart';

class ReplayTask {
  ReplayTask(this._logFile, {Stream<String> logProvider}) {
    if (logProvider != null) {
      assert(logProvider.isBroadcast);
      cancel = logProvider.listen((String event) {
        addLog(event);
      });
    }
  }

  File _logFile;
  IOSink _logSink;
  StreamSubscription cancel;
  final List<Uint8List> snapshot = <Uint8List>[];

  void addLog(String line) {
    _logSink ??= _logFile.openWrite();
    _logSink.writeln(line);
  }

  Future<void> addSnapshot() async {
    final screenshot = await takeScreenSnapshot();
    snapshot.add(screenshot);
  }

  Future<void> close() async {
    await cancel?.cancel();
    await _logSink?.flush();
    await _logSink?.close();
  }

  Future<List<int>> save() async {
    await close();

    final  tarEncoder = TarEncoder();
    OutputStream outputStream = OutputStream();
    tarEncoder.start(outputStream);

    AppInfo appInfo = await UIAutomator.instance.getAppInfo();
    final appInfoBytes = appInfo.writeToBuffer();
    UIAutomator.logger.info('write AppInfo: $appInfo');
    tarEncoder.add(ArchiveFile(TarKey.appInfo,appInfoBytes.length,appInfoBytes));


    if (_logSink != null && _logFile.existsSync()) {
      await _logSink.done;
      //todo InputFileStream.file bug report
      final logData = await _logFile.readAsBytes();
      UIAutomator.logger.info('write log: ${logData.length}');
      tarEncoder.add(ArchiveFile(TarKey.log,logData.length,logData));
    }

    for (int i = 0; i < snapshot.length; i++) {
      tarEncoder.add(ArchiveFile('${TarKey.screenshotPrefix}$i',snapshot[i].length,snapshot[i]));
    }


    tarEncoder.finish();
    return outputStream.getBytes();
  }
}
