import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/layout/screen_size.dart';

class BlogItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postsData = Provider.of<PostsModel>(context, listen: false);
    final _posts = _postsData.getPosts(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen(context) ? paddingSmall : paddingLarge),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        children: _posts,
      ),
    );
  }
}
