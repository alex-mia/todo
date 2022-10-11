import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/data_task/task.dart';
import 'package:todo/add_new_todo/state_tasks.dart';


final AddNewRiverpodProvider = StateNotifierProvider<AddNewProvider, StateTasks>((ref) => AddNewProvider());

class AddNewProvider extends StateNotifier<StateTasks> {
  AddNewProvider() : super(StateTasks(0, null, null, null, null, null));

  void addTextField(String text) {
    state = StateTasks(state.iconChange, text, state.date, state.color, state.project, null);
  }

  void setDate(DateTime? date) {
    state =  StateTasks(state.iconChange, state.textTask, date, state.color, state.project, null);
  }

  void setProject(String project, Color color) {
    String projects = project;
    state =  StateTasks(state.iconChange, state.textTask, state.date, color, projects, null);
  }

  void addTaskState(String textTask, DateTime? date, String project,) {
    if (date == null) {;
      TaskDto task = TaskDto(id: null,
        iconChange: state.iconChange.hashCode,
        textTask: textTask,
        date: 0,
        color: state.color.toString(),
        project: project,);
      state = StateTasks(
          state.iconChange, textTask, date, state.color, project, task);
    } else {
      TaskDto task = TaskDto(id: null,
        iconChange: state.iconChange.hashCode,
        textTask: textTask,
        date: date.day,
        color: state.color.toString(),
        project: project,);
      state = StateTasks(
          state.iconChange, textTask, date, state.color, project, task);
    }
  }
}