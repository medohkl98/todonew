import 'package:cloud_firestore/cloud_firestore.dart';
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
}