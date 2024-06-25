import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme { white, dark }

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.white: ThemeData(
    fontFamily: "Poppins",
    dialogTheme: const DialogTheme(
        titleTextStyle: TextStyle(
      color: Colors.black,
    )),
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    unselectedWidgetColor: AppColors.primary,
    //primarySwatch: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black87,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontFamily: 'Poppins',
      ),
      headlineMedium: TextStyle(
        color: Colors.black54,
        fontFamily: 'Poppins',
      ),
      titleSmall: TextStyle(
        color: Colors.white70,
        fontFamily: 'Poppins',
        fontSize: 18.0,
      ),
    ),
  ),
  AppTheme.dark: ThemeData(
    unselectedWidgetColor: AppColors.primary,
    primaryColorDark: Colors.black,
    //primarySwatch: mycolor,
    scaffoldBackgroundColor: AppColors.black,
    //primaryColor: FlexThemeData.dark(scheme: _scheme, darkIsTrueBlack: true);
    brightness: Brightness.dark,
    dialogTheme: const DialogTheme(
        titleTextStyle: TextStyle(
      color: Colors.white,
    )),
    bottomSheetTheme: const BottomSheetThemeData(
        //backgroundColor: AppColors.grey_90,
        ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: AppColors.grey),
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.grey),
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    dividerColor: Colors.grey.shade800,
    //bottomAppBarTheme: BottomAppBarTheme(color: AppColors.grey_90),
    cardTheme: const CardTheme(
        //color: AppColors.grey_80,
        ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.grey,
        fontSize: 20.0,
        fontFamily: 'Poppins',
      ),
      titleSmall: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
        fontSize: 18.0,
      ),
      headlineMedium: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      displaySmall: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      displayMedium: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      displayLarge: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle(
        color: Colors.grey,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
      ),
    ),
  ),
};

MaterialColor mycolor = const MaterialColor(
  0xFF558B2F,
  <int, Color>{
    50: Color(0xffce5641), //10%
    100: Color(0xffb74c3a), //20%
    200: Color(0xffa04332), //30%
    300: Color(0xff89392b), //40%
    400: Color(0xff733024), //50%
    500: Color(0xff5c261d), //60%
    600: Color(0xff451c16), //70%
    700: Color(0xff2e130e), //80%
    800: Color(0xff170907), //90%
    900: Color(0xff000000), //100%
  },
);
