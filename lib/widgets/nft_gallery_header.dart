import 'package:flutter/material.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  const Delegate();

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapseContent) {
    return Container(
      color: Colors.red,
    );
  }
}
