

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todonew/core/services/snack_bar_service.dart';
import 'package:todonew/core/utiles.dart';
import 'package:todonew/models/task_model.dart';

class FirebaseUtils{
  static CollectionReference<TaskModel> getCollectionRef(){

    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName).
    withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromFireStore(snapshot.data()!),
      toFirestore: (taskModel, _) =>taskModel.toFireStore() ,
    );
  }
  static Future<void> addTaskModel(TaskModel taskModel){
    CollectionReference<TaskModel> collectionRef=getCollectionRef();
    DocumentReference<TaskModel> docRef=collectionRef.doc();
    taskModel.id=docRef.id;
    return  docRef.set(taskModel);
  }
  static Future<List<TaskModel>> getDocument(DateTime selectedDate ) async {
    var collectionRef = getCollectionRef().where("selectedDate",isEqualTo:selectedFormatedDate(selectedDate).millisecondsSinceEpoch );

    QuerySnapshot<TaskModel> docs = await collectionRef.get();

    // Directly map the docs to a list of TaskModel
    List<TaskModel> takeList = docs.docs.map((e) => e.data()).toList();

    return takeList;
  }
  static Stream <QuerySnapshot<TaskModel>>? getStream (DateTime selectedDate )  {
    var collectionRef = getCollectionRef()
        .where("selectedDate",
        isEqualTo:selectedFormatedDate(selectedDate).millisecondsSinceEpoch );

    //QuerySnapshot<TaskModel> docs = await collectionRef.get();

    // Directly map the docs to a list of TaskModel
    // List<TaskModel> takeList = docs.docs.map((e) => e.data()).toList();

    return collectionRef.snapshots();
  }
  static Future<void> deleteTask(TaskModel taskModel) async {
    var collectionRef=getCollectionRef();
    var docRef=collectionRef.doc(taskModel.id);
    return docRef.delete();
  }
  static Future<void> updateTask(TaskModel taskModel) async {
    var collectionRef=getCollectionRef();
    var docRef=collectionRef.doc(taskModel.id);
    return docRef.update({"isDone": true});
  }
static Future<bool> creatPass(String email,String pass) async {

  try {
    EasyLoading.show();
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    EasyLoading.dismiss();
    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      EasyLoading.dismiss();
      SnackBarService.showFailedMessage("The password provided is too weak");
      return Future.value(false);
    } else if (e.code == 'email-already-in-use') {

      print('The account already exists for that email.');
      EasyLoading.dismiss();
      SnackBarService.showFailedMessage('The account already exists for that email.');
      return Future.value(false);
    }
  } catch (e) {
    print(e);
  }

  return Future.value(false);}
static Future<bool> signIn(String email,String pass) async {

  try {
    EasyLoading.show();
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass
    );
    EasyLoading.dismiss();
    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      EasyLoading.dismiss();
      SnackBarService.showFailedMessage("No user found for that email.");
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      EasyLoading.dismiss();
      SnackBarService.showFailedMessage("Wrong password provided for that user");
    }
  }


  return Future.value(false);}
}