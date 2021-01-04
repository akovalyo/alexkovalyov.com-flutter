import 'package:flutter/material.dart';

import 'package:mysite/helpers.dart';
import 'package:mysite/consts/consts.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = screenSize(context);
    final _height = _screenSize.height - appBarHeight - footerHeight;

    return Container(
      height: _height < 200 ? 200 : _height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'CONTACT',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            width: 150,
            child: Divider(
              thickness: 5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
    //     Container(
    //       padding: const EdgeInsets.symmetric(
    //         vertical: 20,
    //         horizontal: paddingSmall,
    //       ),
    // );
  }
}
