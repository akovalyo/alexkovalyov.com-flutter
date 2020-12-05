import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HoverAnimatedImage extends StatefulWidget {
  final String image;
  final double width;
  final double height;

  final double hoverHeight;
  final double hoverWidth;
  final double borderRadius;
  final int animationDuration;

  HoverAnimatedImage({
    @required this.image,
    @required this.width,
    @required this.height,
    @required this.hoverHeight,
    @required this.hoverWidth,
    this.borderRadius = 0.0,
    this.animationDuration = 500,
  });

  @override
  _HoverAnimatedImageState createState() => _HoverAnimatedImageState();
}

class _HoverAnimatedImageState extends State<HoverAnimatedImage> {
  double _height;
  double _width;
  BorderRadiusGeometry _borderRadius;
  Duration _duration;

  @override
  void initState() {
    super.initState();

    _width = widget.width;
    _height = widget.height;
    _borderRadius = BorderRadius.circular(widget.borderRadius);
    _duration = Duration(milliseconds: widget.animationDuration);
  }

  void _increase(PointerEvent details) {
    setState(() {
      _width = widget.hoverWidth;
      _height = widget.hoverHeight;
    });
  }

  void _decrease(PointerEvent details) {
    setState(() {
      _width = widget.width;
      _height = widget.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _increase,
      onExit: _decrease,
      child: AnimatedContainer(
        child: Image(
          fit: BoxFit.fitWidth,
          image: NetworkImage(widget.image),
        ),
        width: _width,
        height: _height,
        decoration: BoxDecoration(borderRadius: _borderRadius),
        duration: _duration,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
