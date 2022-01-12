import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class HoverLink extends StatelessWidget {
  final String title;
  final double fontSize;
  final VoidCallback onPressed;

  const HoverLink({
    Key? key,
    this.title = '',
    this.fontSize = 14.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      height: 1,
      minWidth: 0,
      padding: const EdgeInsets.all(0),
      child: Text(title,
          style: TextStyle(
            fontSize: fontSize,
          )),
      textColor: Theme.of(context).secondaryHeaderColor,
      hoverTextColor: Theme.of(context).colorScheme.secondary,
      hoverElevation: 0,
      focusElevation: 0,
      hoverColor: Color(0x00000000),
      highlightColor: Color(0x00000000),
      splashColor: Color(0x00000000),
      onpressed: onPressed,
    );
  }
}
