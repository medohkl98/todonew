import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todonew/features/tasks/widgets/addtaskbottomsheet.dart';


import '../settings/settings_view.dart';
import '../tasks/tasks_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndx=0;
  List <Widget> screens=[
    TasksView(),
    SettingsView()
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme =Theme.of(context);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(40)
        ),
        onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskBottomSheetWidget(),
            );
      },
        child: CircleAvatar(
          radius: 25,
          backgroundColor: theme.primaryColor,
          child: const Icon(Icons.add,
            size: 20,
              color: Colors.white,
          )
          ,
        ),
      ),
      body: screens[currentIndx],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        height: 95,
        color: Colors.white,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndx,
            onTap: (value){
            setState(() {
              currentIndx=value;
            });
            } ,
            items: const [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                "assets/icons/tasks_icn.png"
            )
            ),
              label: "Tasks",
            ) ,
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                "assets/icons/Ico_settings.png"
            )
            ),
              label: "Settings",
            )
        
        ]
        ),
      ),
    );
  }
}
