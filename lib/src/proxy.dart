part of 'ui_automator.dart';

class ProxyWidgetsFlutterBinding extends WidgetsFlutterBinding {
  static  ProxyBinaryMessenger _proxy;

  @override
  BinaryMessenger createBinaryMessenger() {
    _proxy = ProxyBinaryMessenger(super.createBinaryMessenger());
    return _proxy;
  }
}

class ProxyBinaryMessenger implements BinaryMessenger {
  final BinaryMessenger _binaryMessenger;
  ui.PlatformMessageCallback _proxy;
  int currentTextConnId;
  bool _disableKeyboard=false;

  ProxyBinaryMessenger(this._binaryMessenger);

  void disableKeyboard(){
    _disableKeyboard=true;
  }
  void enableKeyboard(){
    _disableKeyboard=false;
  }

  Future<void> enterText(String text) async {
    if (currentTextConnId == null) throw Exception('currentTextConnId == null');
    return handlePlatformMessage(
      SystemChannels.textInput.name,
      SystemChannels.textInput.codec.encodeMethodCall(
        MethodCall(
          'TextInputClient.updateEditingState',
          <dynamic>[
            currentTextConnId,
            TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length))
                .toJSON()
          ],
        ),
      ),
      (ByteData _) {},
    );
  }

  void setHandlePlatformMessage(
      ui.PlatformMessageCallback platformMessageCallback) {
    _proxy = platformMessageCallback;
  }

  @override
  bool checkMessageHandler(String channel, MessageHandler handler) {
    return _binaryMessenger.checkMessageHandler(channel, handler);
  }

  @override
  bool checkMockMessageHandler(String channel, MessageHandler handler) {
    return _binaryMessenger.checkMessageHandler(channel, handler);
  }

  @override
  Future<void> handlePlatformMessage(String channel, ByteData data,
      ui.PlatformMessageResponseCallback callback) {
    _proxy?.call(channel, data, callback);
    return _binaryMessenger.handlePlatformMessage(channel, data, callback);
  }

  @override
  Future<ByteData> send(String channel, ByteData message) {
    if (SystemChannels.textInput.name == channel && message != null) {
      final methodCall =
          SystemChannels.textInput.codec.decodeMethodCall(message);
      if (methodCall.method == 'TextInput.setClient') {
        int id = methodCall.arguments[0] as int;
        currentTextConnId = id;
      }
      if (_disableKeyboard&&methodCall.method == 'TextInput.show') {
        return null;
      }
    }
    return _binaryMessenger.send(channel, message);
  }

  @override
  void setMessageHandler(String channel, MessageHandler handler) {
    return _binaryMessenger.setMessageHandler(channel, handler);
  }

  @override
  void setMockMessageHandler(String channel, MessageHandler handler) {
    return _binaryMessenger.setMockMessageHandler(channel, handler);
  }
}
