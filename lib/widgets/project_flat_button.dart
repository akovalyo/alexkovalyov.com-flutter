import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/prefer_sdk/js.dart' as js;

import 'package:mysite/consts/routes.dart';

class ProjectFlatButton extends StatelessWidget {
  final String link;
  final String title;

  ProjectFlatButton({
    this.link,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      onPressed: () {
        if (link.startsWith('http')) {
          js.context.callMethod('open', [link]);
        } else {
          navKey.currentState.pushNamed(link, arguments: true);
        }
      },
      mouseCursor: SystemMouseCursors.click,
      color: Theme.of(context).primaryColor,
    );
  }
}
