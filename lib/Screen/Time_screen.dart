import 'package:flutter/material.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/Screen/LanguageShowBottemSheet.dart';
import 'package:to_do/Screen/ShowTheamBootemSheetTheam.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Time_screen extends StatefulWidget {
  const Time_screen({Key? key}) : super(key: key);

  @override
  State<Time_screen> createState() => _Time_screenState();
}

class _Time_screenState extends State<Time_screen> {
  @override
  Widget build(BuildContext context) {
    var appLocal=AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
              appLocal!.langage,
          style: TextStyle(
            color: Colors.black87,
          )),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                ShowTheamBootemSheet();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: primaryColor,

                  ),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(appLocal.english,
                       style: Theme.of(context).textTheme.bodySmall,
                      ),
                     Icon(
                       Icons.arrow_drop_down,
                       size: 28,
                       color: primaryColor,
                     ),
                   ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              appLocal.mode,
              style: TextStyle(
                color: Colors.black87,
              )),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                ShowTheamBootemSheeTheam();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: primaryColor,

                    ),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appLocal.light,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 28,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  void ShowTheamBootemSheet(){
   showModalBottomSheet(context: context, builder: (context) {
     return LanguageShowBottemSheet();
   },
   );
  }
  void ShowTheamBootemSheeTheam(){
    showModalBottomSheet(context: context, builder: (context) {
      return ShowTheamBootemSheetTheam();
    },);
  }
}
