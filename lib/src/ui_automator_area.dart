import 'package:auto/auto.dart';
import 'package:flutter/material.dart';

final GlobalKey screenKey = GlobalKey();

class UIAutomatorArea extends StatefulWidget {
  final Widget child;
  final bool showIndicator;

  const UIAutomatorArea({Key key,@required this.child, this.showIndicator = true})
      : super(key: key);

  @override
  _UIAutomatorAreaState createState() => _UIAutomatorAreaState();
}

class _UIAutomatorAreaState extends State<UIAutomatorArea> {


  @override
  void initState() {
    UIAutomator.instance.addListener(onUpdated);
    super.initState();
  }

  @override
  void dispose() {
    UIAutomator.instance.removeListener(onUpdated);
    super.dispose();
  }

  void onUpdated() {
    if (mounted) {
      setState(() {});
    }
  }

  Border getBorder() {
    Border border;
    if (UIAutomator.instance.isStarted) {
      border = Border.all(color: Colors.green, width: 3);
    } else if (UIAutomator.instance.isPaused) {
      border = Border.all(color: Colors.amber, width: 3);
    } else if (UIAutomator.instance.isReplaying) {
      border = Border.all(color: Colors.blueAccent, width: 3);
    }
    return border;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        RepaintBoundary(
          key: screenKey,
          child: widget.child,
        ),
        if(widget.showIndicator)
          IgnorePointer(
              child: Container(
                decoration: BoxDecoration(border: getBorder()),
              )),
      ],
    );
  }
}
