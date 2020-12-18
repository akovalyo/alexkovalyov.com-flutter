import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/js.dart' as js;

import 'package:mysite/consts/social.dart';
import 'package:mysite/widgets/hover_icon_button.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: HoverIconButton(
                  onPressed: () => js.context.callMethod('open', [githubUrl]),
                  imageProvider: NetworkImage(
                      'https://img.icons8.com/ios-filled/48/000000/github.png'),
                  secondColor: Theme.of(context).accentColor,
                  duration: Duration(milliseconds: 200),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: HoverIconButton(
                  onPressed: () => js.context.callMethod('open', [linkedinUrl]),
                  imageProvider: NetworkImage(
                      'https://img.icons8.com/ios-filled/48/000000/linkedin.png'),
                  secondColor: Theme.of(context).accentColor,
                  duration: Duration(milliseconds: 200),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: HoverIconButton(
                  onPressed: () => js.context.callMethod('open', [twitterUrl]),
                  imageProvider: NetworkImage(
                      'https://img.icons8.com/ios-filled/48/000000/twitter.png'),
                  secondColor: Theme.of(context).accentColor,
                  duration: Duration(milliseconds: 200),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: HoverIconButton(
                  onPressed: () => js.context.callMethod('open', [instUrl]),
                  imageProvider: NetworkImage(
                      'https://img.icons8.com/ios-filled/48/000000/instagram.png'),
                  secondColor: Theme.of(context).accentColor,
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ],
          ),
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
              'Copyright Alex Kovalyov © 2020',
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
