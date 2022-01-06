import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/js.dart' as js;

import '../navigation/routes.dart';
import 'button.dart';

class ProjectButton extends StatelessWidget {
  final String? link;
  final String? title;

  ProjectButton({
    this.link,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AkButton(
      child: Text(title!, style: TextStyle(fontSize: 18)),
      onPressed: () {
        if (link!.startsWith('http')) {
          js.context.callMethod('open', [link]);
        } else {
          navKey.currentState?.pushNamed(link!, arguments: true);
        }
      },
      borderWidth: 0,
      backgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).secondaryHeaderColor,
      hoverColor: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
