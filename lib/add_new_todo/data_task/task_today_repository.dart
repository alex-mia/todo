import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/database_helper.dart';
import 'package:todo/add_new_todo/data_task/task.dart';


final DataTasksTodayRiverpodProvider =
StateNotifierProvider<DataTasksTodayProvider, List <TaskDto>>(
        (ref) => DataTasksTodayProvider());

class DataTasksTodayProvider extends StateNotifier<List<TaskDto>> {
  DataTasksTodayProvider() : super([]);

  Future<List<TaskDto>> get getTasksToday async {
    final db = DatabaseHelper.instance;
    final result = await db.getTasksToday();
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
