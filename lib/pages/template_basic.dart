import 'package:flutter/material.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/page_elements/ak_app_bar.dart';
import 'package:mysite/page_elements/drawer.dart';

class TemplateBasic extends StatelessWidget {
  final Widget child;

  TemplateBasic(this.child);
  @override
  Widget build(BuildContext context) {
    final _screenSize = screenSize(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(),
      ),
      drawer: AkDrawer(),
      body: child,
    );
  }
}
