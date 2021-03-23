import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HoverBlogContainer extends StatefulWidget {
  final String image;
  final double width;
  final double height;
  final double hoverHeight;
  final double hoverWidth;
  final String title;
  final String description;
  final double borderRadius;
  final int animationDuration;

  HoverBlogContainer({
    required this.image,
    required this.width,
    required this.height,
    required this.hoverHeight,
    required this.hoverWidth,
    this.title = '',
    this.description = '',
    this.borderRadius = 0.0,
    this.animationDuration = 500,
  });

  @override
  _HoverBlogContainerState createState() => _HoverBlogContainerState();
}

class _HoverBlogContainerState extends State<HoverBlogContainer> {
  late double _height;
  late double _width;
  late BorderRadiusGeometry _borderRadius;
  late Duration _duration;
  late ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    if (widget.image.startsWith('http')) {
      _imageProvider = NetworkImage(widget.image);
    } else {
      _imageProvider = AssetImage(widget.image);
    }

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
      child: Column(
        children: [
          AnimatedContainer(
            child: Image(
              fit: BoxFit.fitWidth,
              image: _imageProvider,
            ),
            width: _width,
            height: _height,
            decoration: BoxDecoration(borderRadius: _borderRadius),
            duration: _duration,
            curve: Curves.fastOutSlowIn,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: widget.width,
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: widget.width,
            child: Text(widget.description),
          ),
        ],
      ),
    );
  }
}
