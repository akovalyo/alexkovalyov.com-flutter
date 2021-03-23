import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FadeInImageAny extends StatelessWidget {
  final String imagePath;
  final Widget placeholder;
  final Widget? child;
  final Duration duration;
  final double width;
  final double height;
  final BoxFit fit;

  const FadeInImageAny({
    required this.imagePath,
    required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    required this.width,
    required this.height,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider _image;
    if (imagePath.startsWith(RegExp(r'[http|https]'))) {
      _image = NetworkImage(imagePath);
    } else {
      _image = AssetImage(imagePath);
    }
    return Image(
      image: _image,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSyncLoaded) {
        if (wasSyncLoaded || !kIsWeb) {
          return this.child ?? child;
        } else {
          return AnimatedSwitcher(
            duration: duration,
            child: frame != null ? this.child ?? child : placeholder,
          );
        }
      },
    );
  }
}
