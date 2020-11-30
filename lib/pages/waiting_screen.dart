import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Kovalyov',
      debugShowCheckedModeBanner: false,
      //theme: akTheme(Brightness.light),
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
