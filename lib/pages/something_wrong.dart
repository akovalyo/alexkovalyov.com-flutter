import 'package:flutter/material.dart';

import 'package:mysite/theme/theme.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Kovalyov',
      debugShowCheckedModeBanner: false,
      theme: akTheme(Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Container(),
        ),
        body: Center(
          child: Container(
            child: Text('Oops! Something went wrong',
                style: Theme.of(context).textTheme.headline1),
          ),
        ),
      ),
    );
  }
}
