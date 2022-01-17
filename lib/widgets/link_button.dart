import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LinkButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.transparent; // Defer to the widget's default.
        }),
      ),
      onPressed: onPressed,
    );
  }
}
