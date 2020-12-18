import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/rendering.dart';

class HoverIconButton extends StatelessWidget {
  final ImageProvider imageProvider;
  final void Function() onPressed;
  final Duration duration;
  final Curve curve;
  final Color firstColor;
  final Color secondColor;

  HoverIconButton({
    @required this.imageProvider,
    @required this.onPressed,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInCirc,
    this.firstColor = Colors.white,
    this.secondColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: HoverCrossFadeWidget(
        cursor: SystemMouseCursors.click,
        firstChild: ColorFiltered(
          child: Image(
            image: imageProvider,
          ),
          colorFilter: ColorFilter.mode(firstColor, BlendMode.src),
        ),
        secondChild: ColorFiltered(
          child: Image(
            image: imageProvider,
          ),
          colorFilter: ColorFilter.mode(secondColor, BlendMode.src),
        ),
        duration: duration,
        firstCurve: curve,
      ),
    );
  }
}
