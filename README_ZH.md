# Auto

Auto是一个面向测试人员开发的Flutter自动化测试框架

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
  UIAutomator.ensureInitialized();
  runApp(UIAutomatorArea(child: MyApp()));
}
```
## IDE安装
请看[Auto Ide](https://github.com/auto-flutter/auto_ide)


## 使用
[演示视频](https://user-images.githubusercontent.com/28224568/110477128-c12e3e00-811d-11eb-9749-e35f359531f3.mp4)

## License
[Apache-2.0 License](https://github.com/auto-flutter/auto/blob/main/LICENSE)