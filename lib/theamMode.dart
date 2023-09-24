import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyThemData {

  static ThemeData lightThem = ThemeData(
    backgroundColor: Color(0xffDFECDB),
    scaffoldBackgroundColor:Color(0xffDFECDB),


    colorScheme: ColorScheme(
      primary:  Color(0xFF5D9CEC),
      brightness: Brightness.light,
      onPrimary: Colors.white,
      secondary: Color(0xFF5D9CEC),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white10,
      background: Colors.black,
      onBackground: Colors.transparent,
      onSurface: Colors.white10,
      surface: Colors.transparent,

    ),

    appBarTheme: AppBarTheme(
      toolbarHeight: 100,



    ),
    textTheme: TextTheme(
      bodyMedium:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color:Color(0xff383838),
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),


    ),
  );

  static ThemeData darkTheam = ThemeData(
    backgroundColor: Color(0xff060E1E),
    scaffoldBackgroundColor:  Color(0xff060E1E),
    colorScheme: ColorScheme(
      primary: Colors.grey.shade300,
      brightness: Brightness.dark,
      onPrimary: Colors.black,
      secondary: Colors.grey.shade300,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white10,
      background: Colors.transparent,
      onBackground: Colors.transparent,
      onSurface: Colors.white10,
      surface: Colors.transparent,
    ),

    appBarTheme: AppBarTheme(
      toolbarHeight: 100,
      color: Color(0xff4083D9),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,


      ),

    ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141922),

      selectedIconTheme: IconThemeData(
        color: Colors.blue,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff5D9CEC)
    ),
    textTheme: TextTheme(
      bodyMedium:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color:Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,

      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
    ),

  );
}
