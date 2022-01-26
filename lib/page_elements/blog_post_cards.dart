import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/consts.dart';
import '../helpers/screen_helper.dart';
import '../models/app_state.dart';

class BlogPostCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final List<Widget> postCards = appState.getPostTiles(context);
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
              horizontal: ScreenHelper.isSmallScreen(context)
                  ? paddingSmall
                  : paddingLarge),
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            children: postCards,
          ),
        ),
      ],
    );
  }
}
