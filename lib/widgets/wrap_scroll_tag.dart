import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class WrapScrollTag extends StatelessWidget {
  final AutoScrollController controller;
  final int index;
  final Widget child;

  WrapScrollTag({
    this.controller,
    this.index,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: controller,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }
}
