import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 65,
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(42),
            bottomRight: Radius.circular(42),
        ),
    ),
    
   iconTheme: IconThemeData(color: white),
  ),

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
  )
  );
}