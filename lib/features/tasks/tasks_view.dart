import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todonew/core/firebase_utils.dart';
import 'package:todonew/features/tasks/widgets/tasks_widget.dart';
import 'package:todonew/models/task_model.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  var _focusDate =DateTime.now();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery =MediaQuery.of(context);
    ThemeData theme =Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Stack(
            clipBehavior: Clip.none,
            //alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: mediaQuery.size.height*0.22,
                width: mediaQuery.size.width,
                color: theme.primaryColor,
                padding: EdgeInsets.only(left:20,
                right: 20,
                top: 60,
                ),
                child: Text( "To Do List",
                  textAlign:TextAlign.start ,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color:  Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 115,

                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: EasyInfiniteDateTimeLine(
                    controller: _controller,
                    firstDate: DateTime.now(),
                    focusDate: _focusDate,
                    lastDate: DateTime(2025, 12, 31),
                    onDateChange: (selectedDate) {
                      setState(() {
                        _focusDate = selectedDate;
                      }
                      );
                    },
                    dayProps: EasyDayProps(
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        dayStrStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,

                        ),
                        dayNumStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,),
                        monthStrStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,


                      ),

                    ),
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        dayStrStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                        dayNumStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,),
                        monthStrStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,


                      ),

                    ),

                  ),
                    showTimelineHeader: false,
                ),
              ),

          ),

                ],
              ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseUtils.getStream(_focusDate),
            builder: (context, snapshot) {
              if (snapshot.hasError){
                return const Center(
                  child: Text(
                    "Error",
                  ),
                );

              }
              if (snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              }
             List<TaskModel>tasksList= snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => TaskWidget(data: tasksList[index],),

                itemCount:  tasksList?.length??0,
              );
            },
          ),
        ),
        // Expanded(
        //   child: FutureBuilder(
        //       future: FirebaseUtils.getDocument(_focusDate),
        //       builder: (context, snapshot) {
        //         if (snapshot.hasError){
        //   return const Center(
        //     child: Text(
        //     "Error",
        //     ),
        //   );
        //
        //       }
        //       if (snapshot.connectionState==ConnectionState.waiting){
        //       return Center(
        //         child: CircularProgressIndicator(
        //         color: theme.primaryColor,
        //         ),
        //       );
        //       }
        //       return ListView.builder(
        //         padding: EdgeInsets.zero,
        //         itemBuilder: (context, index) => TaskWidget(data: snapshot.data![index],),
        //       itemCount:  snapshot.data?.length??0,
        //       );
        //       },
        //       ),
        // ),
        // Expanded(
        //   child: ListView.builder(
        //     padding: EdgeInsets.zero,
        //     itemBuilder:(context, index) => TaskWidget(),
        //
        //   itemCount: 10,
        //   ),

    ]);
  }
}
