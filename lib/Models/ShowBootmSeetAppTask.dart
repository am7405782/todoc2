import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBootmSeetAppTask extends StatefulWidget {
  const ShowBootmSeetAppTask({Key? key}) : super(key: key);

  @override
  State<ShowBootmSeetAppTask> createState() => _ShowBootmSeetAppTaskState();
}

class _ShowBootmSeetAppTaskState extends State<ShowBootmSeetAppTask> {
  TextEditingController time= TextEditingController();
  TextEditingController Description= TextEditingController();
  var FormKey=GlobalKey<FormState>();
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:Color(0xff383838),
                ),
              ),
              SizedBox(
                height: size.height*0.04,
              ),
              TextFormField(
                controller: time,
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
                controller: Description,
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
                  ShowDateDickerTAsk();
                },
                child: Text(
                  "12/12/2012",
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
                    print("ddddddddddd");
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
  ShowDateDickerTAsk(){
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
  }
}
