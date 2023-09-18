import 'package:flutter/material.dart';
import 'color.dart';
class MyTheam {
  static final ThemeData LightTheam = ThemeData(
    scaffoldBackgroundColor: Color(0xffDFECDB),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: WhiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
  );
}
