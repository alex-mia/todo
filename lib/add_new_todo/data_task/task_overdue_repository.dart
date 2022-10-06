import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/database_helper.dart';
import 'package:todo/add_new_todo/data_task/task.dart';


final DataTasksOverdueRiverpodProvider =
StateNotifierProvider<DataTasksOverdueProvider, List <TaskDto>>(
        (ref) => DataTasksOverdueProvider());

class DataTasksOverdueProvider extends StateNotifier<List<TaskDto>> {
  DataTasksOverdueProvider() : super([]);

  Future<List<TaskDto>> get getTasksOverdue async {
    final db = DatabaseHelper.instance;
    final result = await db.getTasksOverdue();
    print('Просроченные задачи - $result');
    state = result.map((e) => TaskDto.fromJson(e)).toList();
    return  result.map((e) => TaskDto.fromJson(e)).toList();
  }

  Future<int> deleteTask(TaskDto task) async{
    return DatabaseHelper.instance.deleteTask(task.id!);
  }

  Future<int> updateOverdueTask(TaskDto task, iconChange) async{
    final db = DatabaseHelper.instance;
    return db.updateTask(task, iconChange, task.id!);
  }
}
