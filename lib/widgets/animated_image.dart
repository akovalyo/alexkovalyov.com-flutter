import 'package:flutter/material.dart';

class AnimatedImage extends StatelessWidget {
  final String path;
  final Alignment alignment;
  final double? width;
  final double? enlargedWidth;
  final double? height;
  final double? enlargedHeight;

  AnimatedImage(
      {required this.path,
      this.alignment = Alignment.center,
      this.width,
      this.enlargedWidth,
      this.height,
      this.enlargedHeight});

  @override
  Widget build(BuildContext context) {
    final id = DateTime.now().toString();
    final ImageProvider<Object> _image = path.startsWith('http')
        ? NetworkImage(path)
        : AssetImage(path) as ImageProvider<Object>;

    return Container(
      width: width,
      height: height,
      alignment: alignment,
      child: InkWell(
        mouseCursor: SystemMouseCursors.zoomIn,
        child: Hero(
          tag: id,
          child: Image(
            image: _image,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AnimatedImageEnlarged(
              image: _image,
              id: id,
              enlargedWidth: enlargedWidth,
              enlargedHeight: enlargedHeight,
            );
          }));
        },
      ),
    );
  }
}

class AnimatedImageEnlarged extends StatelessWidget {
  final ImageProvider image;
  final String id;
  final double? enlargedWidth;
  final double? enlargedHeight;

  AnimatedImageEnlarged({
    required this.image,
    required this.id,
    this.enlargedWidth,
    this.enlargedHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: enlargedWidth,
        height: enlargedHeight,
        color: Theme.of(context).primaryColor,
        child: GestureDetector(
          child: Hero(
            tag: id,
            child: Image(
              fit: BoxFit.fill,
              width: enlargedHeight,
              height: enlargedHeight,
              image: image,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
