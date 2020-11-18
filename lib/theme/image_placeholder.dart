import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FadeInImageAny extends StatelessWidget {
  final ImageProvider image;
  final Widget placeholder;
  final Widget child;
  final Duration duration;
  final double width;
  final double height;
  final BoxFit fit;

  const FadeInImageAny({
    @required this.image,
    @required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronousluLoaded) {
        if (wasSynchronousluLoaded || !kIsWeb) {
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
