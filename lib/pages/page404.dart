import 'package:flutter/material.dart';

import 'package:mysite/theme/consts.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: appBarHeight,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Center(
              child: Text('404', style: Theme.of(context).textTheme.headline4)),
        ),
      ],
    );
  }
}
