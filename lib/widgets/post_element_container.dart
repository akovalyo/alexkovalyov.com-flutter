import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostElementContainer extends StatelessWidget {
  final Widget child;
  final double vertPadding;
  final double horPadding;
  final Color background;
  final Alignment alignment;

  PostElementContainer({
    required this.child,
    this.vertPadding = 0,
    this.horPadding = 0,
    this.background = Colors.white,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        vertical: vertPadding,
        horizontal: horPadding,
      ),
      child: child,
      color: background,
    );
  }
}
