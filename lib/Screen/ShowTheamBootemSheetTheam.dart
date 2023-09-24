import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/provider/SetingProvider.dart';

class ShowTheamBootemSheetTheam extends StatelessWidget {
  const ShowTheamBootemSheetTheam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<SetingProvider>(context);
     return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.06,
          ),
          Text("Choose Theam",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.06,
          ),
          InkWell(
            onTap: ()=>provider.changeTheam(ThemeMode.light),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: Text(
                  "light",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),

                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          InkWell(
            onTap: ()=>provider.changeTheam(ThemeMode.dark),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: Text(
                  "Dark",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),

                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
