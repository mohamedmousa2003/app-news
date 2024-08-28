import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 50,
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(42),
            bottomRight: Radius.circular(42),
        ),
    ),
    
   iconTheme: IconThemeData(color: white),
  ),
    scaffoldBackgroundColor: transparent,
  drawerTheme: DrawerThemeData(
    
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
      color: white,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: white,
      fontSize: 14,
    )
  )
  );
}