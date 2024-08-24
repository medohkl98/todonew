class TaskModel{
  static const String collectionName="TasksCollection";
  String? id;
  String? title;
  String description;
  DateTime selectedDate;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
  required  this.description,
   required this.selectedDate,
    this.isDone = false,
  });
  factory TaskModel.fromFireStore(Map<String,dynamic> json)=>TaskModel(
    id: json["id"],
    title: json["title"],
      description: json["description"],
      selectedDate: DateTime.fromMicrosecondsSinceEpoch(json["selectedDate"]),
    isDone: json["isDone"],
  );
  Map <String, dynamic>  toFireStore(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "selectedDate":selectedDate.microsecondsSinceEpoch,
      "isDone":isDone,


    };
  }
}