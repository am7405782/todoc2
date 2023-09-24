import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/Layout/HomeLayOut.dart';
import 'package:to_do/Screen/loginScreen.dart';

import '../ٍshared/Style/color.dart';

class Splach_Scrren extends StatelessWidget {
static const String routeName="Splach_Scrren";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushNamed(LoginSreen.routeName);
    });
    return Container(
      color: Theme.of(context).backgroundColor,
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
