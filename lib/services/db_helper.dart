import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zawanza1/models/user.dart';


class DbHelper {
  static final DbHelper _instance = DbHelper._internal();

  factory DbHelper() => _instance;

  static Database? _database;

  DbHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "my_store.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nick TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database? db = await database;
    return await db!.insert('users', user.toMap());
  }

  Future<bool> isUserAuthenticated(String email, String password) async {
    Database? db = await database;
    List<Map<String, dynamic>> result = await db!.query(
      'users',
      where: 'nick = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }
}