import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String path;
  final double fontSize;
  final bool column;

  const MenuItem({
    @required this.title,
    @required this.path,
    this.fontSize,
    this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: column
          ? EdgeInsets.only(bottom: 10, top: 10)
          : EdgeInsets.only(right: 10, left: 10),
      child: FlatButton(
        onPressed: () {
          //Navigator.of(context).pushNamed(elem['link']);
          //print(elem['title']);
        },
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
