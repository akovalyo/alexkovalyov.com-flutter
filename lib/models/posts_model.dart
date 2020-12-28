import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/widgets/hover_blog_container.dart';

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
      _cards.add(
        GestureDetector(
          onTap: () {
            navKey.currentState.pushNamed(value['path']);
          },
          child: HoverBlogContainer(
            width: _cardSize.width,
            hoverWidth: _cardHoverSize.width,
            height: _cardSize.height,
            hoverHeight: _cardHoverSize.height,
            image: value['image'],
            title: value['title'],
            description: value['description'],
            borderRadius: 10,
          ),
        ),
      );
    });

    return _cards;
  }
}
