import 'package:event_app/cores/constant/colors_manger.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      primary: ColorsManger.primary,
      onPrimary: ColorsManger.whiteForLightMode,
      secondary: ColorsManger.mainDark,
      tertiary: ColorsManger.grey,

    ),


    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,
    foregroundColor: ColorsManger.primary,
    ),
    scaffoldBackgroundColor: ColorsManger.whiteForLightMode,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: ColorsManger.mainDark,
        fontSize: 16,
        fontWeight: FontWeight.w500,

      ),
      titleSmall: TextStyle(
        color: ColorsManger.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,

      ),
        bodyLarge: TextStyle(
        color: ColorsManger.primary,
          fontSize: 20,
          fontWeight: FontWeight.w500,

    )
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: ColorsManger.primary,
      onPrimary: ColorsManger.whiteForDarkMode,
      secondary: ColorsManger.whiteForDarkMode,
      tertiary: ColorsManger.whiteForDarkMode,

    ),


    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,
      foregroundColor: ColorsManger.primary,
    ),
    scaffoldBackgroundColor: ColorsManger.backgroundOfDarkMode,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: ColorsManger.whiteForDarkMode,
        fontSize: 16,
        fontWeight: FontWeight.w500,

      ),
      bodyLarge: TextStyle(
      color: ColorsManger.primary,
      fontSize: 20,
      fontWeight: FontWeight.w500,

    ),


      bodyMedium: TextStyle(
        color: ColorsManger.whiteForDarkMode,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
