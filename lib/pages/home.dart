import 'package:flutter/material.dart';

import 'package:mysite/theme/image_placeholder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Center(
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
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 300,
            child: Text(
              'Hello2',
              style: Theme.of(context).textTheme.headline1,
            ),
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
    );
  }
}
