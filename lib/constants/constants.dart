import 'dart:ui' as ui;

late double kScreenWidth;
late double kScreenHeight;

void getScreenDimensions () {
  kScreenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;
  kScreenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
}