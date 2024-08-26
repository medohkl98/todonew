import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todonew/core/firebase_utils.dart';
import 'package:todonew/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel data;
  const TaskWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery =MediaQuery.of(context);
    ThemeData theme =Theme.of(context);
    return Container(
      margin:EdgeInsets.symmetric(vertical: 12,horizontal: 8) ,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          //dismissible: DismissiblePane(onDismissed: () {}),
              extentRatio: 0.3,
          // All actions are defined in the children parameter.
          children:  [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)
              ),
              onPressed: (context) {
                 FirebaseUtils.deleteTask(data);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          margin:EdgeInsets.symmetric(vertical: 12,horizontal: 8) ,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding:EdgeInsets.symmetric(vertical: 18,horizontal: 20) ,
            leading: Container(
              height: 80,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.primaryColor,
              ),

            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  data.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: theme.primaryColor
                ),


                ),

                Text(
                  data.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: theme.primaryColor
                  ),


                ),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    SizedBox(width: 7,),
                    Text(
                     DateFormat("dd MMM yyyy").format(data.selectedDate),
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor
                    ),


                    ),
                  ],
                ),

              ],
            ),
            trailing: InkWell(
              onTap: (){
                FirebaseUtils.updateTask(data);
              },
              child: Container(
                width: 75,
                height: 35,
                decoration: BoxDecoration(
                  color: data.isDone ?Colors.green :theme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: Icon(Icons.check,size: 30, color: Colors.white,),
              ),
            ),


          ),
        ),
      ),
    );
  }
}
