import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/data_project/project.dart';
import 'package:todo/projects/state_projects.dart';


final AddProjectsRiverpodProvider =
    StateNotifierProvider<AddProjectsProvider, Project>(
        (ref) => AddProjectsProvider());


class AddProjectsProvider extends StateNotifier<Project> {
  AddProjectsProvider() : super(Project('', null, Icons.circle_rounded, null));

  void textProjects(String text) {
    state = Project(text, state.color, Icons.circle_rounded, null);
  }

  void colorProjects(Color color, IconData icon) {
        state = Project(state.text, color, icon, null);
  }

  void addProjects(String text, Color color, IconData icon) {
    ProjectDto project = ProjectDto(id: null, text: text, color: color.toString(), icon: icon.toString(), counter: 1);
    state = Project(text, color, icon, project);
  }
}
