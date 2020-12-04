import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/theme/consts.dart';
import 'package:mysite/widgets/hover_image.dart';

class Posts with ChangeNotifier {
  List<Map> postsList;

  Posts(this.postsList);

  List<Widget> getPosts(BuildContext context) {
    print("postCards");
    final cards = postsList.map((elem) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print("ok");
            },
            child: HoverAnimatedImage(
              width: 380,
              hoverWidth: 395,
              height: 160,
              hoverHeight: 175,
              image: elem['image'],
              borderRadius: 10,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: gridPostsWidthL,
            child: Text(
              elem['title'],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: gridPostsWidthL + 10,
            child: Text(elem['description']),
          ),
        ],
      );
    }).toList();

    return cards;
  }

  // List<Widget> getPosts(BuildContext context) {
  //   print("postCards");
  //   final cards = postsList.map((elem) {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         HoverAnimatedContainer(
  //           width: gridPostsWidthL,
  //           hoverWidth: gridPostsWidthL + 10,
  //           height: gridPostsHeightL,
  //           hoverHeight: gridPostsHeightL + 10,
  //           color: Colors.black,
  //           child: GestureDetector(
  //             onTap: () {
  //               print("ok");
  //             },
  //             child: Image(
  //               fit: BoxFit.fill,
  //               image: NetworkImage(elem['image']),
  //             ),
  //           ),
  //           cursor: SystemMouseCursors.click,
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           width: gridPostsWidthL + 10,
  //           child: Text(
  //             elem['title'],
  //             style: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           width: gridPostsWidthL + 10,
  //           child: Text(elem['description']),
  //         ),
  //         SizedBox(
  //           height: 40,
  //         ),
  //       ],
  //     );
  //   }).toList();

  //   return cards;
  // }
}
