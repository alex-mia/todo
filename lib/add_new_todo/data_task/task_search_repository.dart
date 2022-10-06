import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/database_helper.dart';
import 'package:todo/add_new_todo/data_task/task.dart';
import 'package:todo/search/searchTasks.dart';


final DataTasksSearchRiverpodProvider =
StateNotifierProvider<DataTasksSearchProvider, List <TaskDto>>(
        (ref) => DataTasksSearchProvider());

class DataTasksSearchProvider extends StateNotifier<List<TaskDto>> {
  DataTasksSearchProvider() : super([]);

  Future<List<TaskDto>> get getTasksSearch async {
    final db = DatabaseHelper.instance;
    final result = await db.getTasksSearch(textTask);
    print('$textTask');
    print('Сегодня задачи - $result');
    state = result.map((e) => TaskDto.fromJson(e)).toList();
    return  result.map((e) => TaskDto.fromJson(e)).toList();
  }

  Future<int> deleteTask(TaskDto task) async{
    return DatabaseHelper.instance.deleteTask(task.id!);
  }

  Future<int> updateTodayTask(TaskDto task, iconChange) async{
    final db = DatabaseHelper.instance;
    return db.updateTask(task, iconChange, task.id!);
  }
}
