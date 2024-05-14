import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

Future<Uint8List> capturePng(globalKey) async {
  try {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  } catch (e) {
    return Uint8List(0);
  }
}
