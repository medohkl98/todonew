import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todonew/models/task_model.dart';

class FirebaseUtils{
  CollectionReference<TaskModel> getCollectionRef(){

  return FirebaseFirestore.instance
      .collection(TaskModel.collectionName).
  withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromFireStore(snapshot.data()!),
      toFirestore: (taskModel, _) =>taskModel.toFireStore() ,
  );
}
Future<void> addTaskModel(TaskModel taskModel){
  CollectionReference<TaskModel> collectionRef=getCollectionRef();
  DocumentReference<TaskModel> docRef=collectionRef.doc();
    taskModel.id=docRef.id;
   return  docRef.set(taskModel);
}
}