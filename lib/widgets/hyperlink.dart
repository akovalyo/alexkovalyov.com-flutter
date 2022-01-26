import 'package:flutter/material.dart';
import 'package:universal_html/js.dart' as js;

class Hyperlink extends StatelessWidget {
  final String link;
  final Widget? titleWidget;
  final String? title;
  final Color? color;
  final double fontSize;
  final Function? onTap;
  const Hyperlink({
    Key? key,
    this.link = '',
    this.titleWidget,
    this.title,
    this.color,
    this.fontSize = 18,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: titleWidget != null
          ? titleWidget
          : Text(
              title != null ? title as String : link,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.underline,
                color: color != null
                    ? color
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
      onTap: onTap != null
          ? onTap!()
          : () {
              js.context.callMethod('open', [link]);
            },
    );
  }
}
