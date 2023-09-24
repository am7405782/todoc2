import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';

import 'package:to_do/Screen/widget/UpadteTasks.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';
import 'package:to_do/modual/TaskMoeal.dart';

class AddTaskSreen extends StatelessWidget {
 TaskModel taskModel ;
 AddTaskSreen(this.taskModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Slidable(
        startActionPane: ActionPane(motion:ScrollMotion(),

            children: [
              SlidableAction(
                autoClose: true,
                spacing: 100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                onPressed: (context) {
                  FireBaseFuncation.DeleteTasks(taskModel.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                autoClose: true,
                onPressed: (context) {
                  Navigator.of(context).pushNamed(UpadteTasksScreen.routeName);

                },
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),

            ],
        ),

        child: Card(
          margin: EdgeInsets.only(
            top: 10,
          ),

         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12)
         ),

          child: Container(
            height: 90,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),

            child: Row(
              children: [

                taskModel.States ? VerticalDivider(
                  thickness: 3,
                  width: 3,
                  color: GreenColor,
                ):VerticalDivider(
                  thickness: 3,
                  width: 3,
                  color: primaryColor,
                ),
                SizedBox(width: 10,),

                Column(
                  children: [
                    Text(
                      taskModel.title,
                      style: taskModel.States? GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: GreenColor,
                      ):GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    Text(
                      taskModel.Description,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                taskModel.States ?
                Text("Done!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: GreenColor,
                ),)
                    :
                InkWell(
                  onTap: (){
                    taskModel.States=true;
                    FireBaseFuncation.updateTasks(taskModel.id, taskModel);
                  },
                  child: Container(
                  
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
