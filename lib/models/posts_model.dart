import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/layout/adaptive.dart';

class PostItem {}

class PostsModel {
  final List posts;

  PostsModel(this.posts);

  List get postsList {
    return posts;
  }

  List postCards(BuildContext context) {
    final bool _isSmallScr = isSmallScreen(context);
    List<Widget> cards = posts.map((elem) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverAnimatedContainer(
            width: _isSmallScr ? gridPostsWidthS : gridPostsWidthL,
            hoverWidth:
                _isSmallScr ? gridPostsWidthS + 10 : gridPostsWidthL + 10,
            height: _isSmallScr ? gridPostsHeightS : gridPostsHeightL,
            hoverHeight:
                _isSmallScr ? gridPostsHeightS + 10 : gridPostsHeightL + 10,
            color: Colors.black,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(elem['image']),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: _isSmallScr ? gridPostsWidthS + 10 : gridPostsWidthL + 10,
            child: Text(
              elem['title'],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: _isSmallScr ? gridPostsWidthS + 10 : gridPostsWidthL + 10,
            child: Text(elem['description']),
          ),
        ],
      );
    }).toList();

    return cards;
  }
}
