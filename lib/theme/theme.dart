import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mysite/theme/colors.dart';

//

// final ThemeData lightTheme = _akLightTheme();
// final ThemeData darkTheme = _akDarkTheme();

ThemeData akTheme(Brightness brightness, String theme) {
  // final base = ThemeData.light();
  if (theme == '2077') {
    return ThemeData.light().copyWith(
      buttonColor: Colors.black,
      brightness: brightness,
      primaryColor: akBlackL,
      primaryColorDark: akBlackLAcc,
      backgroundColor: cp2077,
      errorColor: akAlertL,
      accentColor: cp2077,
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: ThemeData.light().textTheme.bodyText2.copyWith(
                  fontSize: 20,
                  height: 1.5,
                ),
            headline1: ThemeData.light().textTheme.headline1.copyWith(
                  fontFamily: 'Cyberpunk',
                  fontSize: 34,
                  color: akHeadlineL,
                ),
            headline2: ThemeData.light().textTheme.headline2.copyWith(
                  fontFamily: 'Cyberpunk',
                  fontSize: 24,
                  color: cp2077,
                ),
            button: ThemeData.light()
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
      canvasColor: akBlackL,
      iconTheme: _akIconTheme(ThemeData.light().iconTheme, cp2077),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  return brightness == Brightness.light
      ? ThemeData.light().copyWith(
          brightness: brightness,
          buttonColor: Colors.white,
          primaryColor: akBlackD,
          primaryColorDark: akBlackLAcc,
          backgroundColor: Colors.white,
          errorColor: akAlertL,
          accentColor: akAccentL,
          textTheme: GoogleFonts.davidLibreTextTheme(
            ThemeData.light().textTheme.copyWith(
                  bodyText2: ThemeData.light().textTheme.bodyText2.copyWith(
                        fontSize: 20,
                        height: 1.5,
                      ),
                  headline1: ThemeData.light().textTheme.headline1.copyWith(
                        fontSize: 34,
                        color: akHeadlineL,
                      ),
                  headline2: ThemeData.light().textTheme.headline2.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                  button: ThemeData.light()
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
          ),
          canvasColor: akBlackL,
          iconTheme: _akIconTheme(ThemeData.light().iconTheme, Colors.white),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        )
      : ThemeData.dark().copyWith(
          brightness: brightness,
          buttonColor: Colors.white,
          primaryColor: akBlackD,
          primaryColorDark: akBlackDAcc,
          backgroundColor: akBackD,
          errorColor: akAlertD,
          accentColor: akAccentD,
          textTheme: GoogleFonts.davidLibreTextTheme(
            ThemeData.dark().textTheme.copyWith(
                  bodyText2: ThemeData.dark().textTheme.bodyText2.copyWith(
                        fontSize: 20,
                        height: 1.5,
                      ),
                  headline1: ThemeData.dark().textTheme.headline1.copyWith(
                        fontSize: 34,
                        color: akHeadlineD,
                      ),
                  headline2: ThemeData.light().textTheme.headline2.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                  button: ThemeData.dark()
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
          ),
          canvasColor: akBlackL,
          iconTheme: _akIconTheme(ThemeData.dark().iconTheme, Colors.white),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        );
}

IconThemeData _akIconTheme(IconThemeData original, Color color) {
  return original.copyWith(color: color);
}
