import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Oops! Something went wrong',
            style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
