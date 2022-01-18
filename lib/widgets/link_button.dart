import 'package:flutter/material.dart';
import '../theme/theme_helpers.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  const LinkButton(
      {Key? key, required this.title, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
      ),
      style: ButtonStyle(
          textStyle:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.any(interactiveStates.contains)) {
              return TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
              );
            }
            return TextStyle(
              decoration: TextDecoration.underline,
            );
          }),
          foregroundColor: MaterialStateProperty.all(
              color != null ? color : Theme.of(context).colorScheme.secondary),
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
    );
  }
}
