import 'package:flutter/material.dart';

import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/consts/consts.dart';

class ScrollUpward extends StatelessWidget {
  final controller;
  final bool alwaysShow;

  ScrollUpward(this.controller, {this.alwaysShow = true});
  @override
  Widget build(BuildContext context) {
    return (controller.position.pixels < 100 && alwaysShow == false)
        ? Container()
        : Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              hoverColor: Color(0x000000),
              iconSize: 34,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                controller.animateTo(
                  0,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              icon: Icon(Icons.arrow_upward),
            ),
          );
  }
}
