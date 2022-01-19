import 'package:flutter/material.dart';

class NftGalleryHeader extends SliverPersistentHeaderDelegate {
  const NftGalleryHeader();

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapseContent) {
    return Container(
      color: Colors.red,
    );
  }
}
