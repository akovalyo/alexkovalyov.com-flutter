import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mysite/theme/colors.dart';

//

// final ThemeData lightTheme = _akLightTheme();
// final ThemeData darkTheme = _akDarkTheme();

ThemeData akTheme(Brightness brightness) {
  // final base = ThemeData.light();

  return brightness == Brightness.light
      ? ThemeData.light().copyWith(
          brightness: brightness,
          primaryColor: akBlackL,
          primaryColorDark: akBlackLAcc,
          backgroundColor: Colors.white,
          errorColor: akAlertL,
          accentColor: akAccent,
          textTheme: _akTextTheme(ThemeData.light().textTheme, Colors.black),
          canvasColor: akBlackL,
          iconTheme: _akIconTheme(ThemeData.light().iconTheme, Colors.white),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        )
      : ThemeData.dark().copyWith(
          brightness: brightness,
          primaryColor: akBlackD,
          primaryColorDark: akBlackDAcc,
          errorColor: akAlertD,
          accentColor: akAccent,
          textTheme: _akTextTheme(ThemeData.dark().textTheme, Colors.white),
          canvasColor: akBlackL,
          iconTheme: _akIconTheme(ThemeData.dark().iconTheme, Colors.white),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        );
}

// ThemeData _akDarkTheme() {
//   return ThemeData.dark().copyWith();
// }

TextTheme _akTextTheme(TextTheme base, Color color) {
  return GoogleFonts.davidLibreTextTheme(
    base.copyWith(
      bodyText2: base.bodyText2.copyWith(
        fontSize: 20,
        height: 1.5,
      ),
      headline1: base.headline1.copyWith(
        fontSize: 34,
        color: color,
      ),
      button: base.button.copyWith(color: Colors.white),
    ),
  );
}

IconThemeData _akIconTheme(IconThemeData original, Color color) {
  return original.copyWith(color: color);
}
