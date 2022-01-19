import 'package:flutter/material.dart';
import 'package:universal_html/js.dart' as js;

import 'link_button.dart';

class Hyperlink extends StatelessWidget {
  final String link;
  final String? title;
  final Color? color;
  final double fontSize;
  const Hyperlink(
      {Key? key,
      required this.link,
      this.title,
      this.color,
      this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      title: title != null ? title as String : link,
      color: color,
      fontSize: fontSize,
      onPressed: () {
        js.context.callMethod('open', [link]);
      },
    );
  }
}
