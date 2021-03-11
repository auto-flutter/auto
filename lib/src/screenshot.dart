import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:flutter/widgets.dart';

import '../auto.dart';
import 'ui_automator_area.dart';

Future<Uint8List> takeScreenSnapshot() async {
  final w = WidgetsBinding.instance.window;
  Size screenSize = w.physicalSize;

  RenderRepaintBoundary boundary = screenKey.currentContext.findRenderObject();
  final boundarySize = boundary.size;

  final double pixelRatio = math.min(
    screenSize.width / boundarySize.width,
    screenSize.height / boundarySize.height,
  );

  var image = await boundary.toImage(pixelRatio: pixelRatio);
  ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
  UIAutomator.logger
      .info('Screen image width: ${image.width}  height: ${image.height}');
  return byteData.buffer.asUint8List();
}
