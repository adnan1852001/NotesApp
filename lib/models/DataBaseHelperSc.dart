import 'package:notes/models/Sign_up.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperSc {
  Database? database;
  static const String dbName = '/newDoDb.db';
  static const String tableName = 'signUps';
  static const String columnIdSign = 'id';
  static const String columnFirstName = 'firstName';
  static const String columnLastName = 'lastName';
  static const String columnEmail = 'email';
  static const String columnPhone = 'phone';
  static const String columnPassword = 'password';

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
          onCreate: (Database dbSc, int version) async {
        await dbSc.execute(
            'CREATE TABLE $tableName ($columnIdSign INTEGER PRIMARY KEY AUTOINCREMENT ,$columnFirstName TEXT,$columnLastName TEXT,$columnEmail TEXT,$columnPhone TEXT,$columnPassword TEXT)');
      });
      print('Table $tableName created successfully.');
      return database;
    } catch (e) {
      print(e);
      print('Table $tableName error.');
    }
  }

  insertSignUp(SignUpClass signUp) async {
    try {
      database = await initDataBase();
      await database?.insert(tableName, signUp.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future getAllSignUp() async {
    try {
      database = await initDataBase();
      List<Map> resault = await database!.query(tableName);
      List<SignUpClass> signUp =
          resault.map((e) => SignUpClass.fromJson(e)).toList();
      return signUp;
    } catch (e) {
      print(e);
    }
  }

  updateSignUp(SignUpClass signUp) async {
    try {
      database = await initDataBase();
      database?.update(tableName, signUp.toJson(),
          where: '$columnIdSign=?', whereArgs: [signUp.id]);
    } catch (e) {}
  }

  deleteTask(int id) async {
    try {
      database = await initDataBase();
      database!.delete(tableName, where: '$columnIdSign=?', whereArgs: [id]);
    } catch (e) {}
  }

  deleteSginUp(int id) async {
    try {
      database = await initDataBase();
      database!.delete(tableName, where: '$columnIdSign=?', whereArgs: [id]);
    } catch (e) {}
  }
}
