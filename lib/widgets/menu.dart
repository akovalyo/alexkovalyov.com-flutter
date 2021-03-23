import 'package:flutter/material.dart';

import 'package:mysite/consts/routes.dart';
import 'package:mysite/widgets/menu_item.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AkMenu extends StatelessWidget {
  final AutoScrollController? controller;
  final double fontSize;
  final bool isColumn;

  AkMenu({
    this.controller,
    required this.fontSize,
    required this.isColumn,
  });
  @override
  Widget build(BuildContext context) {
    final _items = menuItems.map((elem) {
      return MenuItem(
        controller: controller == null ? null : controller,
        title: elem['title'] as String,
        path: elem['path'] as String,
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
