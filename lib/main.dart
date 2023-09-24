import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Layout/HomeLayOut.dart';
import 'package:to_do/Screen/signUP_Screen.dart';

import 'package:to_do/Screen/widget/UpadteTasks.dart';
import 'package:to_do/firebase_options.dart';
import 'package:to_do/provider/SetingProvider.dart';
import 'package:to_do/theamMode.dart';

import 'Screen/Splach-Screen.dart';
import 'Screen/loginScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(create: (BuildContext context) =>SetingProvider(),

  child: MyApp()));
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
   var provider=Provider.of<SetingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.CurrentLangage),
      theme: MyThemData.lightThem,
      darkTheme: MyThemData.darkTheam,
      themeMode: provider.themeMode,

      debugShowCheckedModeBanner: false,
      routes:{
        Home_LayOut.routeName:(context)=>Home_LayOut(),
        Splach_Scrren.routeName:(context)=>Splach_Scrren(),
        UpadteTasksScreen.routeName:(context)=>UpadteTasksScreen(),
        LoginSreen.routeName:(context)=>LoginSreen(),
        SignUp.routeName:(context)=>SignUp(),


      } ,
      initialRoute:Splach_Scrren.routeName,

    );
  }
}

