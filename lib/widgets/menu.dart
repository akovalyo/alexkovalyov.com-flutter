import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';

class AkMenu {
  final double fontSize;

  AkMenu(this.fontSize);

  List<Widget> _getMenu(bool col) {
    return [
      MenuItem(
        title: 'menu_1',
        path: '/',
        fontSize: fontSize,
        column: col,
      ),
      Divider(),
      MenuItem(
        title: 'menu_2',
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
    return Row(
      children: _getMenu(false),
    );
  }
}
