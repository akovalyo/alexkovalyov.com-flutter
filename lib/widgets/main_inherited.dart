import 'package:flutter/material.dart';

class MainInheritedWidget extends InheritedWidget {
  final List posts;
  final Widget ch;
  MainInheritedWidget(this.posts, this.ch, Widget child) : super(child: child);

  static MainInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MainInheritedWidget old) => posts != old.posts;
}
