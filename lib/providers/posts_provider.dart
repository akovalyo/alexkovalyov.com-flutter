import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/layout/adaptive.dart';

class Posts with ChangeNotifier {
  List<Map> postsList;

  Posts(this.postsList);
  //PostsModel(this.posts);

  List getPosts(BuildContext context) {
    print("postCards");
    final bool _isSmallScr = isSmallScreen(context);
    List<Widget> cards = postsList.map((elem) {
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
            child: GestureDetector(
              onTap: () {
                print("ok");
              },
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(elem['image']),
              ),
            ),
            cursor: SystemMouseCursors.click,
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
