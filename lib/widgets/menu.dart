import 'package:flutter/material.dart';

import 'package:mysite/consts/menu_items_list.dart';
import 'package:mysite/widgets/menu_item.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AkMenu extends StatelessWidget {
  final AutoScrollController controller;
  final double fontSize;
  final bool isColumn;

  AkMenu({
    @required this.controller,
    this.fontSize,
    this.isColumn,
  });
  @override
  Widget build(BuildContext context) {
    final _items = menuItems.map((elem) {
      return MenuItem(
        controller: controller,
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
