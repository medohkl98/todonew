import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:todonew/core/firebase_utils.dart';
import 'package:todonew/core/services/snack_bar_service.dart';
import 'package:todonew/models/task_model.dart';

class AddTaskBottomSheetWidget extends StatefulWidget {
  const AddTaskBottomSheetWidget({super.key});

  @override
  State<AddTaskBottomSheetWidget> createState() => _AddTaskBottomSheetWidgetState();
}

class _AddTaskBottomSheetWidgetState extends State<AddTaskBottomSheetWidget> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DateTime selectedDate=DateTime.now();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery =MediaQuery.of(context);
    ThemeData theme =Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(
        top: 29,
        right: 20,
        left: 20,
        bottom: 15
      ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
        
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: titleController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              validator: (value) {
                if(value==null||value.trim().isEmpty)
                    {
                      return "please Enter Task Title ";
                    }
              },
              decoration:  InputDecoration(
                hintText: "Enter Task Title",
                errorStyle:  theme.textTheme.bodyMedium?.copyWith(
              color: Colors.red,
                fontWeight: FontWeight.w500,
                  fontSize: 16,
              ),
              ),
            ),// AddTask
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: descriptionController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              maxLines:2,
              validator: (value) {
                if(value==null||value.trim().isEmpty)
                {
                  return "please Enter Description ";
                }
              },
              decoration:  InputDecoration(
                  hintText: "Enter Description ",
                errorStyle:  theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ), //Describtion
        
            Text(
              "Select Time",
             // textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
             getSelectedDateTime();
              },
              child: Text(
               DateFormat("dd/MM/yyyy").format(selectedDate),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
              
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            FilledButton(onPressed: (){
              if (formKey.currentState!.validate()){
              TaskModel taskModel=TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      selectedDate: selectedDate);
              EasyLoading.show();
              FirebaseUtils.addTaskModel(taskModel).then((value) {

                Navigator.pop(context);
                EasyLoading.dismiss();
                SnackBarService.showSuccessMessage("msg");
              }
              );

        
            }
              },
              style:FilledButton.styleFrom(
                backgroundColor: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ) ,
              child: Text(
              "Save",
              style: theme.textTheme.bodySmall,
            ),
            )
          ],
          
        ),
      ),

      );
  }
  getSelectedDateTime() async {
    DateTime? currentDate= await showDatePicker(
     context: context,
     firstDate: DateTime.now(),
     lastDate: DateTime.now().add(const Duration(days: 368),),
 );
    if (currentDate!=null)
      {
             setState(() {
               selectedDate=currentDate;
             });
      }
  }
}
