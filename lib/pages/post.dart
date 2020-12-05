import 'package:flutter/material.dart';

class PostBuilder extends StatelessWidget {
  final String path;

  PostBuilder(this.path);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(path),
    );
  }
}
