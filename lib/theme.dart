import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      appBarTheme: AppBarTheme(color: primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: primaryColor,
      ),
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: IconThemeData(color: gray),
      scaffoldBackgroundColor: background,
      cardColor: background,
      backgroundColor: background,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    );
  }
}
