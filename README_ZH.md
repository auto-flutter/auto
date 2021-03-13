#### Language: [English](README.md) | 中文简体

# Auto

`Auto`-一个更简单的Flutter UI自动化测试方案

- 无需编写任何代码
- 录制测试脚本简单高效
- 多平台支持
- 像素级回放
- 远程录制,回放
- ...

<img width="1351" alt="screen" src="https://user-images.githubusercontent.com/28224568/110472903-e66c7d80-8118-11eb-98c7-953119310244.png">


## 入门
#### 1.添加依赖
```yaml
dependencies:
  auto: latest-version
```

#### 2.初始化UIAutomator
```dart
import 'package:auto/auto.dart';
void main() {
  UIAutomator.ensureInitialized(); //确保这行放在代码的最前面
  runApp(UIAutomatorArea(child: MyApp()));
}
```
更多详细的配置请看[example](example)项目
## IDE安装
请看[Auto Ide](https://github.com/auto-flutter/auto_ide)


## 使用
[演示视频](https://user-images.githubusercontent.com/28224568/110477128-c12e3e00-811d-11eb-9749-e35f359531f3.mp4)

## 相关项目
- [Auto Ide](https://github.com/auto-flutter/auto_ide) 
- [Auto Cli](https://github.com/auto-flutter/auto_cli)

## [FAQ](FAQ_ZH.md)

## License
[Apache-2.0 License](https://github.com/auto-flutter/auto/blob/main/LICENSE)
