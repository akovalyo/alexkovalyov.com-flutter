import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/router/routes.dart';

class AkMenu {
  final double fontSize;

  AkMenu(this.fontSize);

  List<Widget> _getMenu(bool col) {
    return [
      MenuItem(
        title: 'Posts',
        path: routeHome,
        fontSize: fontSize,
        column: col,
      ),
      MenuItem(
        title: 'Scroll',
        path: routeScroll,
        fontSize: fontSize,
        column: col,
      ),
      MenuItem(
        title: 'Home',
        path: routeHome2,
        fontSize: fontSize,
        column: col,
      ),
    ];
  }

  Widget column() {
    return Column(
      children: _getMenu(true),
    );
  }

  Widget row() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _getMenu(false),
    );
  }
}
