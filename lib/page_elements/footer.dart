import 'package:flutter/material.dart';

import 'package:mysite/widgets/social_tab.dart';
import 'package:mysite/consts/consts.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: footerHeight,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SocialTab(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Made in Flutter',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Copyright Alex Kovalyov © ${DateTime.now().year}',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
