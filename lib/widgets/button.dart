import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'package:mysite/helpers.dart';

class AkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color color;
  final Color hoverColor;
  final double height;
  final double minWidth;
  final double borderWidth;
  final EdgeInsets padding;

  AkButton({
    required this.onPressed,
    required this.child,
    this.backgroundColor = const Color(0x00000000),
    this.color = Colors.white,
    this.hoverColor = Colors.red,
    this.height = 40.0,
    this.minWidth = 120.0,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return isDesktop()
        ? Padding(
            padding: padding,
            child: HoverButton(
              color: backgroundColor,
              height: height,
              minWidth: minWidth,
              child: child,
              hoverColor: Color(0x00000000),
              textColor: color,
              hoverTextColor: hoverColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: borderWidth,
                    color: color,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
              hoverShape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: borderWidth,
                    color: hoverColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
              onpressed: onPressed,
            ),
          )
        : Padding(
            padding: padding,
            child: FlatButton(
              color: backgroundColor,
              height: height,
              minWidth: minWidth,
              textColor: color,
              onPressed: onPressed,
              hoverColor: hoverColor.withOpacity(0.5),
              splashColor: hoverColor,
              child: child,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: borderWidth,
                    color: color,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
            ),
          );
  }
}
