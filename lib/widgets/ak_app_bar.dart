import 'package:flutter/material.dart';

import 'package:mysite/theme/adaptive.dart';
import 'package:mysite/theme/image_placeholder.dart';
import 'package:mysite/widgets/menu.dart';

class AkAppBar extends StatelessWidget {
  final double opacity;

  AkAppBar(this.opacity);

  @override
  Widget build(BuildContext context) {
    const String _image = 'assets/images/site/akM.png';
    return isSmallScreen(context)
        ? AppBar(
            title: FadeInImageAny(
              image: AssetImage(_image),
              placeholder: SizedBox(
                width: 40,
                height: 60,
              ),
              width: 40,
              height: 60,
            ),
            actions: [],
            elevation: 0,
            centerTitle: true,
            backgroundColor:
                Theme.of(context).primaryColor.withOpacity(opacity),
          )
        : Container(
            color: Theme.of(context).primaryColor.withOpacity(opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 170,
                    ),
                    FadeInImageAny(
                      image: AssetImage(_image),
                      placeholder: SizedBox(
                        width: 40,
                        height: 60,
                      ),
                      width: 40,
                      height: 60,
                    ),
                    AkMenu(18).row(),
                  ],
                ),
              ),
            ),
          );
  }
}
