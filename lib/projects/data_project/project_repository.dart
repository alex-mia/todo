import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/data_project/database_helper.dart';
import 'package:todo/projects/data_project/project.dart';



final DataProjectsRiverpodProvider =
StateNotifierProvider<DataProjectsProvider, List <ProjectDto>>(
        (ref) => DataProjectsProvider());


class DataProjectsProvider extends StateNotifier<List<ProjectDto>> {
  DataProjectsProvider() : super([]);

  Future<List<ProjectDto>> get getProjects async {
    final db = DatabaseHelper.instance;
    final result = await db.getProjects();
    state = result.map((e) => ProjectDto.fromJson(e)).toList();
    return  result.map((e) => ProjectDto.fromJson(e)).toList();
  }

  Future<int> addProject(ProjectDto project) async {
    final db = DatabaseHelper.instance;
    print('Добавил задачу - $db');
    return db.addProject(project);
  }

  Future<int> deleteProject(ProjectDto project) async{
    return DatabaseHelper.instance.deleteProject(project.id!);
  }

}
