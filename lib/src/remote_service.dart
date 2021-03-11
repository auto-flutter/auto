import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:auto/protos/http.pbserver.dart';
import 'package:auto/src/ui_automator.dart';

import '../auto.dart';
import 'tar_key.dart';

class RemoteService {
  static const int _stateError = -100;

  void handleHttpRequest(HttpRequest request) async {
    try {
      await _handleHttpRequest(request);
    } catch (e,s) {
      UIAutomator.logger.error(e);
      UIAutomator.logger.error(s);
      _internalServerError(request, e.toString());
    }
  }

  Future<void> _handleHttpRequest(HttpRequest request) async {
    if (request.uri.pathSegments.isEmpty) {
      return _notFound(request);
    }
    final method = request.uri.pathSegments.last;

    if (method == 'start') {
      await start(request);
    } else if (method == 'stop') {
      await stop(request);
    } else if (method == 'replay') {
      await replay(request);
    } else if (method == 'stopReplay') {
      await stopReplay(request);
    } else if (method == 'ping') {
      await ping(request);
    } else if (method == 'info') {
      await info(request);
    } else if (method == 'pause') {
      await pause(request);
    } else if (method == 'continue') {
      await continue1(request);
    } else if (method == 'addCheckpoint') {
      await addCheckpoint(request);
    } else if (method == 'addDelay') {
      await addDelay(request);
    } else if (method == 'enterText') {
      await enterText(request);
    } else {
      return _notFound(request);
    }
  }

  Future<void> ping(HttpRequest request) async {
    request.response.close();
  }

  Future<void> info(HttpRequest request) async {
    final info = await UIAutomator.instance.getAppInfo();
    request.response.add(info.writeToBuffer());
    request.response.close();
  }

  Future<void> start(HttpRequest request) async {
    final queryParameters = request.uri.queryParameters;
    final force = queryParameters['force'];
    final disableKeyboard = queryParameters['disableKeyboard'];
    if (UIAutomator.instance.inRecord) {
      if (force != null) {
        await UIAutomator.instance.stop();
      } else {
        return _badRequest(request, _stateError,
            'Auto Automator is recording and cannot start');
      }
    }
    if (UIAutomator.instance.isReplaying) {
      if (force != null) {
        await UIAutomator.instance.stopReplay();
      } else {
        return _badRequest(request, _stateError,
            'Auto Automator is replaying and cannot start');
      }
    }

    await UIAutomator.instance.start(disableKeyboard: disableKeyboard!=null);
    request.response.close();
  }

  Future<void> pause(HttpRequest request) async {
    UIAutomator.instance.pause();
    request.response.close();
  }

  Future<void> continue1(HttpRequest request) async {
    UIAutomator.instance.continue1();
    request.response.close();
  }

  Future<void> addCheckpoint(HttpRequest request) async {
    await UIAutomator.instance.addCheckpoint();
    request.response.close();
  }

  Future<void> addDelay(HttpRequest request) async {
    final queryParameters = request.uri.queryParameters;
    final delay = queryParameters['delay'];
    if (delay == null || delay.isEmpty) {
      return _badRequest(request, _stateError, 'delay parameter is null');
    }
    UIAutomator.instance.addDelay(Duration(microseconds: int.parse(delay)));
    request.response.close();
  }

  Future<void> enterText(HttpRequest request) async {
    final body = await _toIntList(request);
    final text = utf8.decode(body);

    await UIAutomator.instance.enterText(text);
    request.response.close();
  }

  Future<void> stop(HttpRequest request) async {
    List<int> tarList = await UIAutomator.instance.stop();
    request.response.add(tarList);
    request.response.close();
  }

  Future<void> replay(HttpRequest request) async {
    final queryParameters = request.uri.queryParameters;
    final force = queryParameters['force'];
    if (UIAutomator.instance.inRecord) {
      if (force != null) {
        await UIAutomator.instance.stop();
      } else {
        return _badRequest(request, _stateError,
            'Auto Automator is recording and cannot replay');
      }
    }
    if (UIAutomator.instance.isReplaying) {
      if (force != null) {
        await UIAutomator.instance.stopReplay();
      } else {
        return _badRequest(request, _stateError,
            'Auto Automator is replaying and cannot start');
      }
    }

    final decoder = TarDecoder();
    Archive archive = decoder.decodeBytes(await _toIntList(request));

    List<int> data;
    final List<List<int>> dependencies = [];
    final iterator = archive.iterator;
    while (iterator.moveNext()) {
      if (iterator.current.name == TarKey.replayData) {
        data = iterator.current.content as List<int>;
      } else if (iterator.current.name.startsWith(TarKey.dependencyPrefix)) {
        dependencies.add(iterator.current.content as List<int>);
      }
    }

    List<int> tarList = await UIAutomator.instance
        .replayWithRawData(data, dependencies: dependencies);
     request.response.add(tarList);
    request.response.close();
  }

  Future<void> stopReplay(HttpRequest request) async {
    await UIAutomator.instance.stopReplay();
    request.response.close();
  }

  Future<List<int>> _toIntList(Stream<List<int>> stream) async {
    return await stream.fold<List<int>>(<int>[],
        (List<int> previous, List<int> element) {
      previous.addAll(element);
      return previous;
    });
  }

  void _notFound(HttpRequest request) {
    request.response.statusCode = HttpStatus.notFound;
    BadRequestResponse response = BadRequestResponse();
    response.message = "Not found";
    request.response.add(response.writeToBuffer());
    request.response.close();
  }

  void _internalServerError(HttpRequest request, String message) {
    request.response.statusCode = HttpStatus.internalServerError;
    BadRequestResponse response = BadRequestResponse();
    response.message = message;
    request.response.add(response.writeToBuffer());
    request.response.close();
  }

  void _badRequest(HttpRequest request, int errorCode, String message) {
    request.response.statusCode = HttpStatus.badRequest;
    BadRequestResponse response = BadRequestResponse();
    response.errorCode = errorCode;
    response.message = message;
    request.response.add(response.writeToBuffer());
    request.response.close();
  }
}
