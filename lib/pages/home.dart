import 'package:flutter/material.dart';

import 'package:mysite/theme/image_placeholder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
              child: FadeInImageAny(
                image: AssetImage('assets/images/site/main.jpg'),
                placeholder: SizedBox(
                  width: _screenSize.width,
                  height: _screenSize.height * 0.4,
                ),
                width: _screenSize.width,
                height: _screenSize.height * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 300,
              child: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    child: Text('First'),
                  ),
                  PopupMenuItem(
                    child: Text('Second'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: DropdownButton(items: [
                DropdownMenuItem(value: "1", child: Text("1")),
                DropdownMenuItem(value: "2", child: Text("2")),
              ], onChanged: (value) {}),
            ),
            SizedBox(
              height: 300,
              child: Text(
                'Hello3',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 300,
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 300,
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
