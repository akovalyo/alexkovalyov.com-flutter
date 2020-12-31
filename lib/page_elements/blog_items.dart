import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/helpers.dart';

class BlogItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postsData = Provider.of<PostsModel>(context, listen: false);
    final _posts = _postsData.getPosts(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'BLOG',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Container(
          width: 100,
          child: Divider(
            thickness: 5,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: isSmallScreen(context) ? paddingSmall : paddingLarge),
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            children: _posts,
          ),
        ),
      ],
    );
  }
}
