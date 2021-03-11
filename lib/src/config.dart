import 'log.dart';

typedef DeviceInfoGet = Future<DeviceInfo> Function();

class DeviceInfo {
  final String name;

  DeviceInfo({this.name});
}

class Config {
  Config(
      {this.remoteConfig,
      this.logProvider,
      this.deviceInfo,
      this.logger = const ConsoleLogger()})
      : assert(logProvider == null || logProvider.isBroadcast);

  ///If you configure this option, turn on the remote service
  ///See: [RemoteService]
  final RemoteConfig remoteConfig;

  ///If this option is configured, the log will be recorded during playback
  ///
  ///```dart
  ///  // ignore: close_sinks
  ///   StreamController<String> streamController;
  ///   runZoned(() {
  ///     streamController =
  ///     StreamController<String>.broadcast();
  ///     UIAutomator.ensureInitialized(
  ///         config: UIAutomator.defaultConfig.copyWith(
  ///             logProvider: streamController.stream));
  ///     runApp(MyApp());
  ///   }, zoneSpecification: ZoneSpecification(
  ///       print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
  ///     parent.print(zone, line);
  ///     streamController.add(line);
  ///   }));
  ///```
  final Stream<String> logProvider;


  final DeviceInfoGet deviceInfo;

  ///UIAutomator internal logs will be printed using this Logger
  ///See [Logger],[NullLogger],[ConsoleLogger]
  final Logger logger;

  Config copyWith(
      {RemoteConfig remoteConfig,
      Stream<String> logProvider,
      Logger logger,
      DeviceInfoGet deviceInfo}) {
    assert(logProvider == null || logProvider.isBroadcast);
    return Config(
        remoteConfig: remoteConfig ?? this.remoteConfig,
        deviceInfo: deviceInfo ?? this.deviceInfo,
        logger: logger ?? this.logger,
        logProvider: logProvider ?? this.logProvider);
  }
}

class RemoteConfig {
  RemoteConfig(this.port);

  final int port;
}
