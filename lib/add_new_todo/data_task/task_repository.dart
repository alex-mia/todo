import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/database_helper.dart';
import 'package:todo/add_new_todo/data_task/task.dart';


final DataTasksRiverpodProvider =
StateNotifierProvider<DataTasksProvider, List <TaskDto>>(
        (ref) => DataTasksProvider());

class DataTasksProvider extends StateNotifier<List<TaskDto>> {
  DataTasksProvider() : super([]);

  Future<List<TaskDto>> get getTasks async {
    final db = DatabaseHelper.instance;
    final result = await db.getTasks();
    print('Добавил задачу - $result');
    state = result.map((e) => TaskDto.fromJson(e)).toList();
    return  result.map((e) => TaskDto.fromJson(e)).toList();
  }

  Future<int> addTask(TaskDto task) async {
    final db = DatabaseHelper.instance;
    print('Добавил задачу - $db');
    return db.addTasks(task);
  }

  Future<int> deleteTask(TaskDto task) async{
    return DatabaseHelper.instance.deleteTask(task.id!);
  }

  Future<int> updateTask(TaskDto task, iconChange) async{
    final db = DatabaseHelper.instance;
    return db.updateTask(task, iconChange, task.id!);
  }
}
