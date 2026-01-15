import 'package:flutter/material.dart';

class MyDelegateFlow extends FlowDelegate {
  late final Animation<double> animation;

  MyDelegateFlow(this.animation);

  @override
  void paintChildren(FlowPaintingContext context) {
  }

  @override
  bool shouldRepaint(MyDelegateFlow oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
