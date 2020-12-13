import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/consts/consts.dart';

class MainIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HoverCrossFadeWidget(
      cursor: SystemMouseCursors.click,
      firstChild: ColorFiltered(
        child: Image.asset(mainIcon),
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.src),
      ),
      secondChild: ColorFiltered(
        child: Image.asset(mainIcon),
        colorFilter:
            ColorFilter.mode(Theme.of(context).accentColor, BlendMode.src),
      ),
      duration: Duration(milliseconds: 500),
      firstCurve: Curves.easeInCirc,
    );
  }
}
