import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../widgets/menu_item.dart';
import '../models/menu_items_list.dart';

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
    final _items = menuItemsList.map((elem) {
      return MenuItem(
        controller: controller == null ? null : controller,
        title: elem['title'] as String,
        path: elem['path'] as String,
        fontSize: fontSize,
      );
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _items,
    );
  }
}
