import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbHelper{
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  dbHelper._privateConstructor();
  static final dbHelper instance = dbHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database??=await _initDatabase();

  _initDatabase() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async{
    await db.execute('''create table users(users_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,username TEXT,password TEXT)''');
    await db.rawQuery('''insert into users(username,password) values('adcs','adcs')''');
  }


  Future getData() async{
    var db=await instance.database;
    return await db.query('users');
  }
}

