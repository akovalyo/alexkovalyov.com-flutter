import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';

class LinkButton extends StatelessWidget {
  final String? title;
  final String? href;
  final Widget? titleWidget;
  final VoidCallback? onPressed;
  final Color? color;
  final double fontSize;
  const LinkButton({
    Key? key,
    this.title,
    this.href,
    this.onPressed,
    this.titleWidget,
    this.color,
    this.fontSize = 18.0,
  }) : super(key: key);

  static String splitHref(String href) {
    return href.split('/').last;
  }

  Widget _buildChild() {
    if (titleWidget != null) return titleWidget!;
    if (href != null) {
      return Text(
        title != null ? title as String : href as String,
        overflow: TextOverflow.clip,
        softWrap: false,
      );
    }
    return Text(
      title != null ? title as String : '',
      overflow: TextOverflow.clip,
      softWrap: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _buildChild(),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          textStyle:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.any(interactiveStates.contains)) {
              return TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Oswald',
                fontSize: fontSize,
                fontWeight: FontWeight.w200,
              );
            }
            return TextStyle(
              fontFamily: 'Oswald',
              fontSize: fontSize,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w200,
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
      onPressed: onPressed != null ? onPressed : () {},
    );
  }
}
