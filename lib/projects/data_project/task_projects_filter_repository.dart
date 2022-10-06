import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/database_helper.dart';
import 'package:todo/add_new_todo/data_task/task.dart';
import 'package:todo/home.dart';


final DataTasksFilterProjectRiverpodProvider =
StateNotifierProvider<DataTasksFilterProjectProvider, List <TaskDto>>(
        (ref) => DataTasksFilterProjectProvider());

class DataTasksFilterProjectProvider extends StateNotifier<List<TaskDto>> {
  DataTasksFilterProjectProvider() : super([]);

  Future<List<TaskDto>> get getTasksFilterProject async {
    final db = DatabaseHelper.instance;
    final result = await db.getTasksFilterProject(projects);
    print('Фильтр проектов - $result');
    state = result.map((e) => TaskDto.fromJson(e)).toList();
    return  result.map((e) => TaskDto.fromJson(e)).toList();
  }

  Future<int> deleteTask(TaskDto task) async{
    return DatabaseHelper.instance.deleteTask(task.id!);
  }
}