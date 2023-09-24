import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetingProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
   String CurrentLangage ="en";
   void changeCurrentLangage(String newLanguage){
     if(CurrentLangage ==newLanguage) return;
     CurrentLangage =newLanguage;
     notifyListeners();
   }
   void changeTheam (ThemeMode mode){
     themeMode =mode;
     notifyListeners();
   }
}