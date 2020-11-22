import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: AkMenu(29).column(),
        ),
      ),
    );
  }
}
