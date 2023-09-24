import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/Models/UserModel.dart';

import '../Models/ShowBootmSeetAppTask.dart';
import '../Screen/TasksScreen.dart';
import '../Screen/Time_screen.dart';

class Home_LayOut extends StatefulWidget {
static const String routeName ="HomeLayout";

  @override
  State<Home_LayOut> createState() => _Home_LayOutState();

}

class _Home_LayOutState extends State<Home_LayOut> {
  int Index=0;
  List<Widget> Screen=[
    TasksScreen(),
    Time_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    UserModel? args =ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "To Do List${
            args.name
            }",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

          ),
          leadingWidth: 150,

        ),
      body:Screen[Index],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: Index,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            Index=value;
            setState(() {
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(
              Icons.menu,
              size: 30,
            ),label: ""),
            BottomNavigationBarItem(icon: Icon(
              Icons.settings,
              size: 30,
            ),label: ""),
          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        onPressed: () {
          setState(() {

          });
          ShowBootmSteen();


        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
  ShowBootmSteen(){

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      builder: (context) => ShowBootmSeetAppTask(),
    );
  }
}
