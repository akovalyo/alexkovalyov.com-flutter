import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedImage extends StatelessWidget {
  final String path;

  AnimatedImage(this.path);

  @override
  Widget build(BuildContext context) {
    final id = DateTime.now().toString();
    final ImageProvider<Object> _image = path.startsWith('http')
        ? NetworkImage(path)
        : AssetImage(path) as ImageProvider<Object>;

    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      child: GestureDetector(
        child: Hero(
          tag: id,
          child: Image(
            image: _image,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AnimatedImageEnlarged(_image, id);
          }));
        },
      ),
    );
  }
}

class AnimatedImageEnlarged extends StatelessWidget {
  final ImageProvider image;
  final String id;

  AnimatedImageEnlarged(this.image, this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: GestureDetector(
        child: Hero(
          tag: id,
          child: Image(
            image: image,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
