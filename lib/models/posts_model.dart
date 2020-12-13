import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/widgets/hover_image.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/router/routes.dart';

class PostsModel with ChangeNotifier {
  final Map<String, Map> postsMap;
  PostsModel(this.postsMap);

  bool postExist(String path) {
    return postsMap.containsKey(path);
  }

  List<Widget> getPosts(BuildContext context) {
    final _isSmall = isSmallScreen(context);
    final _cardSize = _isSmall
        ? Size(postCardSWidth, postCardSHeight)
        : Size(postCardLWidth, postCardLHeight);
    final _cardHoverSize = _isSmall
        ? Size(postCardSHoverWidth, postCardSHoverHeight)
        : Size(postCardLHoverWidth, postCardLHoverHeight);
    List<Widget> _cards = [];

    postsMap.forEach((key, value) {
      _cards.add(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              navKey.currentState.pushNamed(value['path']);
            },
            child: HoverAnimatedImage(
              width: _cardSize.width,
              hoverWidth: _cardHoverSize.width,
              height: _cardSize.height,
              hoverHeight: _cardHoverSize.height,
              image: value['image'],
              borderRadius: 10,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: _cardSize.width,
            child: Text(
              value['title'],
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: _cardSize.width,
            child: Text(value['description']),
          ),
        ],
      ));
    });

    return _cards;
  }
}
