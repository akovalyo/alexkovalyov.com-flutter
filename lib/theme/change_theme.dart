import 'package:flutter/material.dart';
// import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/theme/dynamic_theme.dart';

void changeTheme(BuildContext context) {
  DynamicTheme.of(context)!.setBrightness(
      Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark);
}
