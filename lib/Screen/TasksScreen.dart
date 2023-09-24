import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/Screen/widget/AddTaskSreen.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';
import 'package:to_do/modual/TaskMoeal.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return
        Container(
          child: Column(
            children: <Widget>[
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor:primaryColor ,
                selectedTextColor: Colors.white,
                height: 100,
                locale: "en",
                dateTextStyle: TextStyle(fontSize: 20),
                monthTextStyle: TextStyle(fontSize: 10),
                dayTextStyle: TextStyle(fontSize: 10),
                onDateChange: (dateValue) {
                  // New date selected
                  setState(() {
                    date=dateValue ;
                  });
                },
              ),
              StreamBuilder<QuerySnapshot<TaskModel>>(
                stream: FireBaseFuncation.GetTAsksFromFireStore(date),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            "SomeSomting Error",
                          ),
                          ElevatedButton(onPressed: (){

                          },child: Text("Tray Again")),
                        ],
                      ),


                    );
                  }
                  var tasksList =

                      snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                  if (tasksList.isEmpty){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.3,
                        ),
                        Text(
                          "No Tasks",
                          style: TextStyle(
                            color: primaryColor,
                             fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                  return Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return AddTaskSreen(tasksList[index]);
                    },
                        itemCount: tasksList.length,
                    ),
                  );

              },)
              // Expanded(
              //   child: ListView.builder(
              //     itemBuilder:(context, index) {
              //     return AddTaskSreen();
              //   },
              //     itemCount: 5,
              //   ),
              // ),
            ],
          ),
        );

  }
}
