import 'package:flutter/material.dart';

import 'package:mysite/page_elements/ak_app_bar.dart';

class PageBuilder extends StatelessWidget {
  final Widget child;

  PageBuilder(this.child);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProjectMinishell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final backSign = ModalRoute.of(context).settings.arguments;
    // print(backSign);
    return Container();

    // Scaffold(
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   appBar: PreferredSize(
    //     preferredSize: Size(_screenSize.width, appBarHeight),
    //     child: AkAppBar(controller),
    //   ),
    //   drawer: AkDrawer(controller),
    //   body: Center(
    //     child: Text('Hello'),
    //   ),
    // );
  }
}
