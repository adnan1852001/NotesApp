import 'package:sqflite/sqflite.dart';

import 'Sign_up.dart';
import 'Task.dart';

class DBHelper extends SignUpClass {
  Database? database;
  static const String dbName = '/toDoDb.db';
  static const String tableName = 'tasks';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnIsComplete = 'iscomplete';
  static const String columnShortDescription = 'shortDescription';
  static const String columnDescription = 'description';

  Future<Database?> initDataBase() async {
    if (database == null) {
      return await createDataBase();
    } else {
      return database;
    }
  }

  createDataBase() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = dbPath + dbName;
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT , $columnName TEXT,$columnShortDescription TEXT,$columnDescription TEXT, $columnIsComplete INTEGER)');
      });
      return database;
    } catch (e) {
      print(e);
    }
  }

  insertTask(Task task) async {
    try {
      database = await initDataBase();
      await database?.insert(tableName, task.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future getAllTasks() async {
    try {
      database = await initDataBase();
      List<Map> resault = await database!.query(tableName);
      List<Task> tasks = resault.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  Future getTaskType(int isComplete) async {
    try {
      database = await initDataBase();
      List<Map> resault = await database!.query(tableName,
          where: '$columnIsComplete=?', whereArgs: [isComplete]);
      List<Task> tasks = resault.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  updateTask(Task task) async {
    try {
      database = await initDataBase();
      database?.update(tableName, task.toJson(),
          where: '$columnId=?', whereArgs: [task.id]);
    } catch (e) {}
  }

  deleteTask(int id) async {
    try {
      database = await initDataBase();
      database!.delete(tableName, where: '$columnId=?', whereArgs: [id]);
    } catch (e) {}
  }
}
