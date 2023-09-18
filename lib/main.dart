import 'package:flutter/material.dart';
import 'package:to_do/%D9%8Dshared/Style/theamMode.dart';
import 'package:to_do/Layout/HomeLayOut.dart';

import 'Screen/Splach-Screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: MyTheam.LightTheam ,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes:{
        Home_LayOut.routeName:(context)=>Home_LayOut(),
        Splach_Scrren.routeName:(context)=>Splach_Scrren(),

      } ,
      initialRoute:Splach_Scrren.routeName,

    );
  }
}

