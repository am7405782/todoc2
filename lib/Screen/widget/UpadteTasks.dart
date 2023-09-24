
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';
import 'package:to_do/modual/TaskMoeal.dart';

class UpadteTasksScreen extends StatefulWidget {
  static const String routeName="UpadteTasksScreen";

  @override
  State<UpadteTasksScreen> createState() => _UpadteTasksScreenState();
}

class _UpadteTasksScreenState extends State<UpadteTasksScreen> {
  DateTime selectedDate=DateUtils.dateOnly(DateTime.now());
  var TitleController =TextEditingController();
  var DetailesController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    TaskModel? arg =ModalRoute.of(context)?.settings.arguments as TaskModel?;
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "To Do List",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

        ),


      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

          ),

          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: size.height*0.02,
                 ),
                 Center(
                   child: Text(
                     "Edit Task ",
                      style: TextStyle(
                        fontSize: 18,
                         fontWeight: FontWeight.bold,

                      ),
                   ),
                 ),
                 SizedBox(
                   height: size.height*0.02,
                 ),
                 TextFormField(
                   controller: TitleController,

                   decoration: InputDecoration(
                     label: Text(
                         "Enter YourTitle",
                       style:TextStyle(
                         fontSize: 20,
                          fontWeight: FontWeight.bold,
                         color: Colors.black,
                       ),
                     ),
                     border: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.black,
                         width: 10,

                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: size.height*0.02,
                 ),
                 TextFormField(
                   controller:DetailesController ,

                   decoration: InputDecoration(
                     label: Text(
                       "Enter Your Details",
                       style:TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                       ),
                     ),
                     border: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.black,
                         width: 10,

                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: size.height*0.03,
                 ),
                 Text(
                   "Select Time ",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,

                   ),
                 ),
                 SizedBox(
                   height: size.height*0.03,
                 ),
                 InkWell(
                   onTap: (){
                     ShowDateDickerTAsk(context);
                   },
                   child: Center(
                     child: Text(
                       selectedDate.toString().substring(0,10),
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.grey,

                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: size.height*0.05,
                 ),
                 Center(
                   child: MaterialButton(onPressed: (){
                     // FireBaseFuncation.updateTasks(arg!.id, arg);
                     // arg?.title=TitleController.text;
                     // arg?.Description=DetailesController.text;
                     // arg?.States=false;
                     // arg?.date= selectedDate as int;


                   },
                     shape: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.white,
                       ),
                     ),
                     child: Text(
                       "Save Changes",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,

                       ),
                     ),
                     color: primaryColor,
                     padding: EdgeInsets.symmetric(horizontal: 20),
                     height: 52,
                   ),
                 ),



               ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowDateDickerTAsk(BuildContext context)async{
    DateTime? choseDate=await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if(choseDate !=null){
      selectedDate=DateUtils.dateOnly(choseDate);
      setState(() {

      });
    }

  }
}
