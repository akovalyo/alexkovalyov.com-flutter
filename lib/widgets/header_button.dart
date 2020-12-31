import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HeaderButton extends StatelessWidget {
  final AutoScrollController controller;
  final String title;
  final int scrollToIndex;

  HeaderButton({
    @required this.controller,
    @required this.scrollToIndex,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: HoverButton(
        height: 40,
        minWidth: 120,
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        hoverColor: Color(0x00000000),
        padding: EdgeInsets.symmetric(vertical: 5),
        textColor: Theme.of(context).secondaryHeaderColor,
        hoverTextColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: Theme.of(context).secondaryHeaderColor),
            borderRadius: BorderRadius.zero),
        hoverShape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.zero),
        onpressed: () {
          controller.scrollToIndex(
            scrollToIndex,
            preferPosition: AutoScrollPosition.begin,
            duration: Duration(milliseconds: 1000),
          );
        },
      ),
    );
  }
}
