import 'package:flutter/material.dart';
import '../theme/theme_helpers.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  const LinkButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          textStyle:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.any(interactiveStates.contains)) {
              return TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Oswald',
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              );
            }
            return TextStyle(
              fontFamily: 'Oswald',
              fontSize: fontSize,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w200,
            );
          }),
          foregroundColor: MaterialStateProperty.all(
              color != null ? color : Theme.of(context).colorScheme.secondary),
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
    );
  }
}
