import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  const LinkButton({
    Key? key,
    this.title = '',
    required this.onPressed,
    this.titleWidget,
    this.color,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: titleWidget != null
          ? titleWidget!
          : Text(
              title,
              overflow: TextOverflow.clip,
              softWrap: false,
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
              );
            }
            return TextStyle(
              fontFamily: 'Oswald',
              fontSize: fontSize,
              decoration: TextDecoration.underline,
            );
          }),
          foregroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            final col =
                color != null ? color : Theme.of(context).colorScheme.secondary;
            if (states.any(interactiveStates.contains)) {
              return col!.withOpacity(0.6);
            }
            return col;
          }),
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
    );
  }
}
