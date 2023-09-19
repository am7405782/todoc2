import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/Screen/widget/AddTaskSreen.dart';

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
              Expanded(
                child: ListView.builder(
                  itemBuilder:(context, index) {
                  return AddTaskSreen();
                },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        );

  }
}
