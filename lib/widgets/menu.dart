import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/consts/menu_items_list.dart';

class AkMenu extends StatelessWidget {
  final double fontSize;
  final bool isColumn;

  AkMenu({this.fontSize, this.isColumn});
  @override
  Widget build(BuildContext context) {
    final _items = menuItems.map((elem) {
      return MenuItem(
        title: elem['title'],
        path: elem['path'],
        fontSize: fontSize,
        column: isColumn,
      );
    }).toList();

    return isColumn
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _items,
          )
        : ListView(
            scrollDirection: Axis.horizontal,
            children: _items,
          );
  }
}
