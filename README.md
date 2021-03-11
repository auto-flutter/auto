#### Language: English | [中文简体](README_ZH.md)

# Auto

Auto is a Flutter automated testing framework developed for testers.

- No need to write any code
- Recording test scripts is very simple
- Multi-platform support
- Pixel-level playback
- Remote recording and playback
- ...

<img width="1351" alt="screen" src="https://user-images.githubusercontent.com/28224568/110472903-e66c7d80-8118-11eb-98c7-953119310244.png">


## Getting Started
#### 1.Add Dependency 
```yaml
dependencies:
  auto: latest-version
```

#### 2.Initialize UIAutomator
```dart
import 'package:auto/auto.dart';
void main() {
  UIAutomator.ensureInitialized(); //Make sure this line is at the top of the code
  runApp(UIAutomatorArea(child: MyApp()));
}
```
For more detailed configuration, please see the [example](example) project

## IDE Installation
See: [Auto Ide](https://github.com/auto-flutter/auto_ide)


## Usage
[Demo Video](https://user-images.githubusercontent.com/28224568/110477128-c12e3e00-811d-11eb-9749-e35f359531f3.mp4)

## Related Project
- [Auto Ide](https://github.com/auto-flutter/auto_ide) 
- [Auto Cli](https://github.com/auto-flutter/auto_cli)

## [FAQ](FAQ.md)

## License
[Apache-2.0 License](https://github.com/auto-flutter/auto/blob/main/LICENSE)
