import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';

class AkMenu {
  final double fontSize;

  AkMenu(this.fontSize);

  List<Widget> _getMenu(bool col) {
    return [
      MenuItem(
        title: 'Posts',
        path: '/',
        fontSize: fontSize,
        column: col,
      ),
      MenuItem(
        title: 'Docs',
        path: '/scroll',
        fontSize: fontSize,
        column: col,
      ),
      MenuItem(
        title: 'Docs',
        path: '/scroll',
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
