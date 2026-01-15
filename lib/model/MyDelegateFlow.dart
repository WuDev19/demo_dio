import 'package:flutter/material.dart';

class MyDelegateFlow extends FlowDelegate {
  late final Animation<double> animation;

  MyDelegateFlow(this.animation): super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = context.childCount - 1; i >= 0; i--) {
      double offsetX = i * 40 * animation.value;
      double offsetY = i * 30 * animation.value;
      print("gia tri cua animation: ${animation.value}");
      context.paintChild(i, transform: Matrix4.translationValues(offsetX, offsetY, 0));
    }
  }

  @override
  bool shouldRepaint(MyDelegateFlow oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
