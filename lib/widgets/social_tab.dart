import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/js.dart' as js;

import 'package:mysite/consts/social.dart';
import 'package:mysite/widgets/hover_icon_button.dart';

class SocialTab extends StatelessWidget {
  const SocialTab();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
