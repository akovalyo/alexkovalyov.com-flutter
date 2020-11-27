import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mysite/theme/colors.dart';

//

final ThemeData lightTheme = _akLightTheme();
final ThemeData darkTheme = _akDarkTheme();

ThemeData _akLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    primaryColor: akBlackL,
    primaryColorDark: akBlackLAcc,
    errorColor: akAlertL,
    accentColor: akAccent,
    textTheme: _akTextTheme(base.textTheme),
    canvasColor: akBlackL,
    iconTheme: _akIconTheme(base.iconTheme, Colors.white),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

ThemeData _akDarkTheme() {
  return ThemeData.dark().copyWith();
}

TextTheme _akTextTheme(TextTheme base) {
  return GoogleFonts.davidLibreTextTheme(
    base.copyWith(
      headline1: base.headline1.copyWith(fontSize: 64),
      button: base.button.copyWith(color: Colors.white),
    ),
  );
}

IconThemeData _akIconTheme(IconThemeData original, Color color) {
  return original.copyWith(color: color);
}
