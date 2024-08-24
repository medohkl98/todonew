import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

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
          children: [
            Text("Play with ",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor
            ),


            ),
            Row(
              children: [
                const Icon(Icons.alarm),
                SizedBox(width: 7,),
                Text("10 am ",
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor
                ),


                ),
              ],
            ),

          ],
        ),
        trailing: Container(
          width: 75,
          height: 35,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
            child: Icon(Icons.check,size: 30, color: Colors.white,),
        ),


      ),
    );
  }
}
