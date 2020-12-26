import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/consts/home_widgets.dart';

class AkMenu with ChangeNotifier {
  static const _menuItems = [
    {
      'title': projects,
      'path': routeHome,
    },
    {
      'title': blog,
      'path': routeHome,
    },
  ];

  List<Widget> getMenuList(double fontSize, bool isColumn) {
    final _items = _menuItems.map((elem) {
      return MenuItem(
        title: elem['title'],
        path: elem['path'],
        fontSize: fontSize,
        column: isColumn,
      );
    }).toList();

    return _items;
  }
}
