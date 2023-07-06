import 'DataBaseHelper.dart';

class Task {
  int? id;
  String? taskName;
  String? shortDescription;
  String? description;
  bool? isComplete;
  Task(
      {this.id,
      this.taskName,
      this.shortDescription,
      this.description,
      this.isComplete});
  toJson() {
    return {
      DBHelper.columnId: id,
      DBHelper.columnName: taskName,
      DBHelper.columnShortDescription: shortDescription,
      DBHelper.columnDescription: description,
      DBHelper.columnIsComplete: isComplete! ? 1 : 0
    };
  }

  Task.fromJson(Map map) {
    taskName = map[DBHelper.columnName];
    description = map[DBHelper.columnDescription];
    shortDescription = map[DBHelper.columnShortDescription];
    id = map[DBHelper.columnId];
    isComplete = map[DBHelper.columnIsComplete] == 1 ? true : false;
  }
}
