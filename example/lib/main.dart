import 'dart:async';
import 'dart:io';

import 'package:auto/auto.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // ignore: close_sinks
  StreamController<String> streamController;
  runZoned(() {
    streamController = StreamController<String>.broadcast();
    UIAutomator.ensureInitialized(
        config: UIAutomator.defaultConfig.copyWith(
            deviceInfo: () async {
              if (Platform.isAndroid) {
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                return DeviceInfo(name: androidInfo.model);
              }
              if (Platform.isIOS) {
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
                return DeviceInfo(name: iosDeviceInfo.name);
              }
              if (Platform.isMacOS) {
                return DeviceInfo(
                    name:
                        '${Platform.operatingSystem} ${Platform.operatingSystemVersion}');
              }
              if (Platform.isWindows) {
                return DeviceInfo(
                    name:
                        '${Platform.operatingSystem} ${Platform.operatingSystemVersion}');
              }
              return null;
            },
            logProvider: streamController.stream));
    runApp(MyApp());
  }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, line);
    streamController.add(line);
  }));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UIAutomatorArea(
      child: MaterialApp(
        title: 'Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UniqueKey _key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: [
                CupertinoButton(
                    child: Text('rebuild'),
                    onPressed: () {
                      setState(() {
                        _key = UniqueKey();
                      });
                    }),
                CupertinoButton(
                    child: Text('print log'),
                    onPressed: () async {
                      print('test log');
                    }),
              ],
            ),
            SubPage(_key),
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatefulWidget {
  SubPage(Key key) : super(key: key);

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  double v1 = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Slider(
              value: v1,
              label: '${v1.round()}',
              max: 100,
              onChanged: (v) {
                setState(() {
                  v1 = v;
                });
              }),
          Text('slider value: $v1'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(),
          ),
          Container(
            height: 400,
            child: ListView.builder(
                itemBuilder: (_, i) => ListTile(
                      title: Text('item $i'),
                    )),
          ),
          CupertinoButton(
              child: Text('page1'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Scaffold(
                          appBar: AppBar(
                            title: Text('page1'),
                          ),
                        )));
              })
        ],
      ),
    );
  }
}
