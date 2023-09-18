import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/Layout/HomeLayOut.dart';

import '../ٍshared/Style/color.dart';

class Splach_Scrren extends StatelessWidget {
static const String routeName="Splach_Scrren";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushNamed(Home_LayOut.routeName);
    });
    return Container(
      color: SplachColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),

        ],
      ),
    );
  }
}
