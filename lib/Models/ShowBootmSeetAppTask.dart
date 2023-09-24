import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';
import 'package:to_do/modual/TaskMoeal.dart';
import 'package:to_do/theamMode.dart';

class ShowBootmSeetAppTask extends StatefulWidget {
  const ShowBootmSeetAppTask({Key? key}) : super(key: key);

  @override
  State<ShowBootmSeetAppTask> createState() => _ShowBootmSeetAppTaskState();
}

class _ShowBootmSeetAppTaskState extends State<ShowBootmSeetAppTask> {

  var FormKey=GlobalKey<FormState>();
  var titletasksController=TextEditingController();
  var DescriptiontasksController=TextEditingController();
  DateTime selectedDate=DateUtils.dateOnly(DateTime.now());
  bool states =false;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(10),

        child: Form(
          key:FormKey ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height*0.01,
              ),
              Text(
                "App New Task",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: size.height*0.04,
              ),
              TextFormField(

                controller: titletasksController,
                validator: (value) {
               if (value == null || value.isEmpty) {
                 return "pleas enter TaskTitle ";
               }
               return null;
                },

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  label: Text(
                    "Enter Your Task",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),



              ),
              SizedBox(
                height: size.height*0.02,
              ),
              TextFormField(
                controller: DescriptiontasksController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "pleas enter Description ";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  label: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


              ),
              SizedBox(
                height: size.height*0.04,
              ),
              Text(
                "SelectTime:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
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
                child: Text(
                  selectedDate.toString().substring(0,10),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  ),

                ),
              ),
              SizedBox(
                height: size.height*0.01,
              ),
              MaterialButton(
                onPressed: (){
                  if(FormKey.currentState!.validate()){
                    TaskModel tasks =TaskModel(
                      date: selectedDate.millisecondsSinceEpoch,
                      Description:DescriptiontasksController.text ,
                      States:false ,
                      title: titletasksController.text,

                    );
                   FireBaseFuncation.addTaskFirebaseStore(tasks).then((value) {
                     Navigator.pop(context);
                   });
                  }
                },
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.blue,
                child: Text(
                  "AddTask",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,

                  ),
                ),
              ),

            ],
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
