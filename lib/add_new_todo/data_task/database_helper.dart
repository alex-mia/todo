import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/add_new_todo/data_task/task.dart';
import 'package:todo/projects/data_project/project.dart';
import 'package:todo/variables.dart';


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
    final String path = '${directory.path}task_database';
    return openDatabase(
        path,
        version: dbVersion,
        onCreate: _onCreateDatabase,
        onUpgrade: (Database db, int oldVersion, int newVersion) {
          if (newVersion == 2) {}
        }
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
      "CREATE TABLE IF NOT EXISTS tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, iconChange INTEGER, textTask TEXT, date INTEGER, color TEXT, project TEXT)",
    );
  }

  Future<List<Map<String, Object?>>> getTasks() async {
    final db = await instance._database;
    // final resultColor = await db.rawQuery('SELECT color FROM projects');
    return db.rawQuery('SELECT * FROM tasks');
  }

  Future<List<Map<String, Object?>>> getTasksOverdue() async {
    final db = await instance._database;
    print('${['{$date_now}'.hashCode]}');
    return db.query( 'tasks', where: 'date=?', whereArgs: [0] );
  }

  Future<List<Map<String, Object?>>> getTasksToday() async {
    final db = await instance._database;
    return db.query( 'tasks', where: 'date=?', whereArgs: [date_now.day] );
  }

  Future<List<Map<String, Object?>>> getTasksUpcoming() async {
    final db = await instance._database;
    print('${date_now.day}');
    return db.query('tasks',
    where: 'date>?', whereArgs: [date_now.day]);
  }

  Future<List<Map<String, Object?>>> getTasksSearch(textTask) async {
    final db = await instance._database;
    return db.query( 'tasks', where: 'textTask=?', whereArgs: [textTask] );
  }

  Future<List<Map<String, Object?>>> getTasksFilterProject(projects) async {
    final db = await instance._database;
    return db.query( 'tasks', where: 'project=?', whereArgs: [projects] );
  }

  Future<int> addTasks(TaskDto task) async {
    final db = await instance._database;
    return db.insert('tasks', {
      'iconChange': task.iconChange,
      'textTask': task.textTask,
      'date': task.date,
      'color': task.color,
      'project': task.project,
    },
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance._database;
    return db.delete('tasks', where: 'id=?', whereArgs: [id]);
  }

  Future<int> updateTask(TaskDto task, int iconChange, id) async {
    final db = await instance._database;
    if (iconChange == 0) {
      iconChange = 1;
    } else {
      iconChange = 0;
    }
    return db.update ('tasks', {
      'iconChange': iconChange,
    },
      where: 'id=?', whereArgs: [id]);
  }
}


