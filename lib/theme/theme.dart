import 'package:flutter/material.dart';

import 'theme_helper.dart';

class AppThemes {
  static const int light = 0;
  static const int dark = 1;
  static const int theme2077 = 2;

  static IconThemeData akIconTheme(IconThemeData original, Color color) {
    return original.copyWith(color: color);
  }

  static ThemeData themeDataLight() {
    return ThemeData.light().copyWith(
      // brightness: brightness,
      primaryColor: ThemeColors.blackLight,
      primaryColorDark: ThemeColors.accentBlackLight,
      backgroundColor: ThemeColors.backgroundLight,
      secondaryHeaderColor: ThemeColors.secondaryLight,
      errorColor: ThemeColors.errorLight,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textTheme: ThemeData.light().textTheme.copyWith(
            caption: ThemeData.light().textTheme.caption!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.accentLight,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.white,
                ),
            bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 1.5,
                ),
            headline3: ThemeData.light().textTheme.headline3!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.headline,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
            headline4: ThemeData.light().textTheme.headline4!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.headline,
                  fontWeight: FontWeight.w500,
                ),
            headline5: ThemeData.light().textTheme.headline5!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.headline,
                  fontSize: 28,
                ),
            headline6: ThemeData.light().textTheme.headline6!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.headline,
                  fontSize: 24,
                ),
            button: ThemeData.light().textTheme.button!.copyWith(
                  fontFamily: 'Oswald',
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
      canvasColor: ThemeColors.blackLight,
      iconTheme: akIconTheme(ThemeData.light().iconTheme, Colors.white),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: ThemeColors.blackLight,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: ThemeColors.accentLight,
          ),
    );
  }

  static ThemeData themeDataDark() {
    return ThemeData.dark().copyWith(
      // brightness: brightness,
      primaryColor: ThemeColors.blackDark,
      primaryColorDark: ThemeColors.accentBlackDark,
      backgroundColor: ThemeColors.backgroundDark,
      secondaryHeaderColor: ThemeColors.secondaryDark,
      errorColor: ThemeColors.errorDark,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textTheme: ThemeData.dark().textTheme.copyWith(
            caption: ThemeData.dark().textTheme.caption!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.accentDark,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.dark().textTheme.bodyText1!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.secondaryDark,
                ),
            bodyText2: ThemeData.dark().textTheme.bodyText2!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.secondaryDark,
                ),
            headline3: ThemeData.dark().textTheme.headline3!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.headline,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
            headline4: ThemeData.dark().textTheme.headline4!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.secondaryDark,
                  fontWeight: FontWeight.w500,
                ),
            headline5: ThemeData.dark().textTheme.headline5!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.secondaryDark,
                  fontSize: 28,
                ),
            headline6: ThemeData.dark().textTheme.headline6!.copyWith(
                  fontFamily: 'Oswald',
                  color: ThemeColors.secondaryDark,
                  fontSize: 24,
                ),
            button: ThemeData.dark().textTheme.button!.copyWith(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
          ),
      canvasColor: ThemeColors.blackLight,
      iconTheme: akIconTheme(ThemeData.dark().iconTheme, Colors.white),
      buttonTheme: const ButtonThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        buttonColor: Colors.transparent,
        focusColor: Colors.transparent,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: ThemeColors.accentDark,
          ),
    );
  }

  static ThemeData themeData2077() {
    return ThemeData.light().copyWith(
      // brightness: brightness,
      primaryColor: ThemeColors.blackLight,
      secondaryHeaderColor: ThemeColors.background2077,
      primaryColorDark: ThemeColors.accentBlackLight,
      backgroundColor: ThemeColors.background2077,
      errorColor: ThemeColors.errorLight,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textTheme: ThemeData.light().textTheme.copyWith(
            caption: ThemeData.light().textTheme.caption!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.secondary2077,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                  color: ThemeColors.secondary2077,
                ),
            bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  height: 1.5,
                ),
            headline3: ThemeData.light().textTheme.headline3!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: Colors.black,
                  fontSize: 40,
                ),
            headline4: ThemeData.light().textTheme.headline4!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: ThemeColors.secondary2077,
                ),
            headline5: ThemeData.light().textTheme.headline5!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: ThemeColors.secondary2077,
                  fontSize: 28,
                ),
            headline6: ThemeData.light().textTheme.headline6!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: ThemeColors.secondary2077,
                  fontSize: 24,
                ),
            button: ThemeData.light().textTheme.button!.copyWith(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
          ),
      canvasColor: ThemeColors.blackLight,
      iconTheme:
          akIconTheme(ThemeData.light().iconTheme, ThemeColors.secondary2077),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: Colors.black,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: ThemeColors.secondary2077,
          ),
    );
  }
}
