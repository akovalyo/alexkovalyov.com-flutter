import 'package:flutter/material.dart';

import '../widgets/image_placeholder.dart';

class AnimatedImage extends StatelessWidget {
  final String path;
  final Alignment alignment;
  final double? width;
  final double? enlargedWidth;
  final double? height;
  final double? enlargedHeight;
  final bool loadingIndicator;

  AnimatedImage({
    required this.path,
    this.alignment = Alignment.center,
    this.width,
    this.enlargedWidth,
    this.height,
    this.enlargedHeight,
    this.loadingIndicator = false,
  });

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
          child: ImagePlaceholder(
            loadingIndicator: loadingIndicator,
            imagePath: path,
            width: width,
            placeholder: Container(
              height: width,
              width: height,
              color: Theme.of(context).primaryColorDark,
            ),
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
