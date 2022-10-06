import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/projects/data_project/project.dart';


const dbVersion = 1;

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper _instance = DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  static Database? _databaseInstance;

  Future<Database> get _database async =>
      _databaseInstance ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}database_database';
    return openDatabase(
        path,
        version: dbVersion,
        onCreate: _onCreateDatabase,
      onUpgrade: (Database db, int oldVersion, int newVersion){
        if(newVersion == 2){
        }
      }
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
        "CREATE TABLE IF NOT EXISTS projects(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, color TEXT, icon TEXT, counter INTEGER)",
    );
  }

  Future<List<Map<String, Object?>>> getProjects() async {
    final db = await instance._database;
    // final resultColor = await db.rawQuery('SELECT color FROM projects');
    return db.rawQuery('SELECT * FROM projects');
  }

  Future<int> addProject(ProjectDto project) async {
    final db = await instance._database;
    return db.insert('projects', {
      'text': project.text,
      'color': project.color,
      'icon': project.icon,
      'counter': project.counter,
    },
    );
  }

  Future<int> deleteProject(int id) async {
    final db = await instance._database;
    return db.delete('projects', where: 'id=?', whereArgs: [id]);
  }
}

