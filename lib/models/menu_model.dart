import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/router/routes.dart';

class AkMenu with ChangeNotifier {
  static const _menuItems = [
    {
      'title': 'Posts',
      'path': routeHome,
    },
    {
      'title': 'Scroll',
      'path': routeScroll,
    },
    {
      'title': 'Home2',
      'path': routeHome2,
    },
  ];

  List<Widget> getMenuList(double fontSize, bool isColumn) {
    final items = _menuItems.map((elem) {
      return MenuItem(
        title: elem['title'],
        path: elem['path'],
        fontSize: fontSize,
        column: isColumn,
      );
    }).toList();

    return items;
  }
}
