import 'package:flutter/material.dart';
import 'package:mysite/models/posts_model.dart';

class MainInheritedWidget extends InheritedWidget {
  final PostsModel posts;
  final Widget ch;
  MainInheritedWidget(this.posts, this.ch, Widget child) : super(child: child);

  static MainInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MainInheritedWidget old) => posts != old.posts;
}
