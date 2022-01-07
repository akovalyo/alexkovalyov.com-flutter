import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../navigation/routes.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isLogged = FirebaseAuth.instance.currentUser != null;
    return _isLogged
        ? Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: HoverButton(
                  height: 1,
                  minWidth: 0,
                  padding: const EdgeInsets.all(0),
                  child: Text('Messages',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  textColor: Theme.of(context).secondaryHeaderColor,
                  hoverTextColor: Theme.of(context).colorScheme.secondary,
                  hoverElevation: 0,
                  focusElevation: 0,
                  hoverColor: Color(0x00000000),
                  highlightColor: Color(0x00000000),
                  splashColor: Color(0x00000000),
                  onpressed: () {
                    navKey.currentState!.pushNamed(Routes.messages.path);
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
              HoverButton(
                height: 1,
                minWidth: 0,
                padding: const EdgeInsets.all(0),
                child: Text('Logout',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                textColor: Theme.of(context).secondaryHeaderColor,
                hoverTextColor: Theme.of(context).colorScheme.secondary,
                hoverElevation: 0,
                focusElevation: 0,
                hoverColor: Color(0x00000000),
                highlightColor: Color(0x00000000),
                splashColor: Color(0x00000000),
                onpressed: () {
                  FirebaseAuth.instance.signOut();
                  Scaffold.of(context).openEndDrawer();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signed out'),
                      backgroundColor: Colors.green[600]!.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ],
          )
        : HoverButton(
            height: 1,
            minWidth: 0,
            padding: const EdgeInsets.all(0),
            child: Text('Login',
                style: TextStyle(
                  fontSize: 18,
                )),
            textColor: Theme.of(context).secondaryHeaderColor,
            hoverTextColor: Theme.of(context).colorScheme.secondary,
            hoverElevation: 0,
            focusElevation: 0,
            hoverColor: Color(0x00000000),
            highlightColor: Color(0x00000000),
            splashColor: Color(0x00000000),
            onpressed: () {
              navKey.currentState!.pushNamed(Routes.login.path);

              Scaffold.of(context).openEndDrawer();
            },
          );
  }
}
