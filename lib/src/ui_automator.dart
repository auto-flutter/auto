import 'dart:async';
import 'dart:io';
import 'dart:io' as io;
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:auto/protos/app_info.pbserver.dart';
import 'package:auto/protos/record.pbserver.dart';
import 'package:auto/src/log.dart';
import 'package:auto/src/replay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../auto.dart';
import 'config.dart';
import 'const.dart';
import 'record.dart';
import 'remote_service.dart';

part 'proxy.dart';

enum Status {
  idle,

  ///Recording script
  started,

  ///Recording paused
  paused,

  ///Replaying
  replaying,
}

class UIAutomator extends ChangeNotifier {
  UIAutomator._(this.config, ProxyBinaryMessenger proxyBinaryMessenger)
      : assert(window.onPointerDataPacket != null),
        _oldPointerDataPacketCallback = window.onPointerDataPacket {
    window.onPointerDataPacket = _handlePointerDataPacket;
    proxyBinaryMessenger.setHandlePlatformMessage(_handleTextInput);
    if (config.remoteConfig != null) {
      HttpServer.bind(InternetAddress.anyIPv4, config.remoteConfig.port)
          .then((server) {
        RemoteService remoteService = RemoteService();
        server.listen(remoteService.handleHttpRequest);
      });
    }
    assert(config.logProvider == null || config.logProvider.isBroadcast);
    _status = Status.idle;
  }

  static final Config defaultConfig = Config(
    remoteConfig: RemoteConfig(7001),
  );

  static void ensureInitialized({Config config}) {
    assert(WidgetsBinding.instance == null);
    if (WidgetsBinding.instance != null) return;
    ProxyWidgetsFlutterBinding();
    _instance = UIAutomator._(
        config ?? defaultConfig, ProxyWidgetsFlutterBinding._proxy);
  }

  static UIAutomator get instance => _instance;
  static UIAutomator _instance;

  final PointerDataPacketCallback _oldPointerDataPacketCallback;
  final Config config;

  RecordTask _task;
  int _next = 0;
  bool _needStopReplay = false;

  Status _status;

  static Logger get logger => _instance.config.logger;

  Status get status => _status;

  bool get isIdle => status == Status.idle;

  bool get isStarted => status == Status.started;

  bool get isPaused => status == Status.paused;

  bool get isReplaying => status == Status.replaying;

  bool get inRecord => isStarted || isPaused;


  void _setStatus(Status newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  ///Prevent the keyboard from popping up
  void disableKeyboard() {
    ProxyWidgetsFlutterBinding._proxy.disableKeyboard();
  }

  void enableKeyboard() {
    ProxyWidgetsFlutterBinding._proxy.enableKeyboard();
  }


  ///Start recording script
  Future<void> start({bool disableKeyboard = false}) async {
    if (isIdle) {
      _setStatus(Status.started);
      _task?.close();
      _task = RecordTask(_createRandomTempFile());
      if (disableKeyboard) {
        this.disableKeyboard();
        _task.addDisableKeyboardEvent();
      } else {
        enableKeyboard();
        _task.addEnableKeyboardEvent();
      }
    } else {
      throw StateError('isIdle == false');
    }
  }

  ///Stop recording script
  Future<List<int>> stop() async {
    if (inRecord) {
      _setStatus(Status.idle);
      RecordTask task = _task;
      _task = null;
      enableKeyboard();
      task.addEnableKeyboardEvent();
      await task.addSnapshot();
      await task.close();
      final tarList = await task.save();
      return tarList;
    }else{
      throw StateError('inRecord==false');
    }
  }

  void pause() async {
    if (isStarted) {
      _task.stopTiming();
      _setStatus(Status.paused);
    }
  }

  void continue1() async {
    if (isPaused) {
      _task.startTiming();
      _setStatus(Status.started);
    }
  }

  Future<void> addCheckpoint() async {
    if (inRecord) {
      await _task?.addSnapshot();
    }
  }

  void addDelay(Duration delay) async {
    if (inRecord) {
      _task?.addDelay(delay);
    }
  }

  Future<void> enterText(String text) {
    return ProxyWidgetsFlutterBinding._proxy.enterText(text);
  }

  Future<AppInfo> getAppInfo() async {
    AppInfo info = AppInfo();
    info.autoApiVersion = Constant.autoApiVersion;
    info.deviceName = (await config.deviceInfo?.call())?.name ?? "Unknown";
    if (io.Platform.isAndroid) {
      info.platform = Platform.android;
    } else if (io.Platform.isIOS) {
      info.platform = Platform.ios;
    } else if (io.Platform.isWindows) {
      info.platform = Platform.windows;
    } else if (io.Platform.isMacOS) {
      info.platform = Platform.macos;
    } else if (io.Platform.isLinux) {
      info.platform = Platform.linux;
    } else if (kIsWeb) {
      info.platform = Platform.web;
    }
    if (kReleaseMode) {
      info.mode = Mode.release;
    } else if (kProfileMode) {
      info.mode = Mode.profile;
    } else if (kDebugMode) {
      info.mode = Mode.debug;
    }

    final window = WidgetsBinding.instance.window;
    info.devicePixelRatio = window.devicePixelRatio;
    info.textScaleFactor = window.textScaleFactor;
    info.physicalHeight = window.physicalSize.height;
    info.physicalWidth = window.physicalSize.width;
    return info;
  }

  ///Stop replay the recorded script
  Future<void> stopReplay() async {
    if (isReplaying) {
      _needStopReplay = true;
    } else {
      throw StateError('isReplaying == false');
    }
  }

  ///Replay the recorded script
  Future<List<int>> replayWithRawData(List<int> data,
      {List<List<int>> dependencies}) async {
    if (!isIdle) {
      throw StateError('isIdle == false');
    }
    _setStatus(Status.replaying);

    RecordPacket recordPacket = RecordPacket.fromBuffer(data);
    final iterator = recordPacket.data
        .map<MemoryRecord>((e) => record2MemoryRecord(e))
        .iterator;

    Iterator<MemoryRecord> dependency;
    if (dependencies != null) {
      dependency = dependencies.expand<MemoryRecord>((bytes) {
        RecordPacket recordPacket = RecordPacket.fromBuffer(bytes);
        return recordPacket.data
            .map<MemoryRecord>((e) => record2MemoryRecord(e));
      }).iterator;
    }

    ReplayTask replayTask = ReplayTask(_createRandomTempFile(),
        logProvider: config.logProvider?.where((event) => isReplaying));
    try {
      await _replay(iterator, replayTask, dependency: dependency);
      _setStatus(Status.idle);
      return await replayTask.save();
    } finally {
      replayTask.close();
    }
  }

  File _createRandomTempFile() {
    final dir = Directory.systemTemp;
    File file = File(
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_${_next++}.temp');
    return file;
  }

  Future<void> _replay(Iterator<MemoryRecord> iterator, ReplayTask replayTask,
      {Iterator<MemoryRecord> dependency}) {
    Completer<void> completer = Completer<void>();

    if (dependency != null) {
      _callNext(dependency, () {
        _callNext(iterator, () {
          completer.complete();
        }, replayTask, false);
      }, replayTask, true);
    } else {
      _callNext(iterator, () {
        completer.complete();
      }, replayTask, false);
    }

    return completer.future;
  }

  void _handlePointerDataPacket(PointerDataPacket packet) {
    if (isStarted) {
      _task.addPointerRecord(packet);
    }
    _oldPointerDataPacketCallback(packet);
  }

  void _handleTextInput(
      String name, ByteData data, PlatformMessageResponseCallback callback) {
    if (isStarted && name == SystemChannels.textInput.name && data != null) {
      _task.addSoftKeyboardRecord(data);
    }
  }

  void _callNext(Iterator<MemoryRecord> iterator, VoidCallback done,
      ReplayTask replayTask, bool isDependency) async {
    if (iterator.moveNext()) {
      if (_needStopReplay) {
        _needStopReplay = false;
        done();
        return;
      }
      final current = iterator.current;
      await Future.delayed(current.delay);
      switch (current.type) {
        case RecordType.pointer:
          try{
            _oldPointerDataPacketCallback(current.pointer);
          }catch(e,s){
            logger.error(e);
            logger.error(s);
          }
          return _callNext(iterator, done, replayTask, isDependency);
        case RecordType.delay:
          return _callNext(iterator, done, replayTask, isDependency);
        case RecordType.enableKeyboard:
          enableKeyboard();
          return _callNext(iterator, done, replayTask, isDependency);
        case RecordType.disableKeyboard:
          disableKeyboard();
          return _callNext(iterator, done, replayTask, isDependency);
        case RecordType.snapshot:
          if (!isDependency) {
            await replayTask.addSnapshot();
          }
          return _callNext(iterator, done, replayTask, isDependency);
        case RecordType.softKeyboard:
          MethodCall methodCall = SystemChannels.textInput.codec
              .decodeMethodCall(current.softKeyboard);
          var byteData = current.softKeyboard;
          if (methodCall.method !=
                  'TextInputClient.requestExistingInputState' &&
              methodCall.method !=
                  'TextInputClient.updateEditingStateWithTag') {
            methodCall.arguments[0] =
                ProxyWidgetsFlutterBinding._proxy.currentTextConnId;
            byteData =
                SystemChannels.textInput.codec.encodeMethodCall(methodCall);
          }
          window.onPlatformMessage(SystemChannels.textInput.name, byteData,
              (_) => _callNext(iterator, done, replayTask, isDependency));
          return;
        default:
          done();
      }
    } else {
      done();
    }
  }
}
