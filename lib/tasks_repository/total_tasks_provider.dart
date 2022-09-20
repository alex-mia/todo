import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/add_projects_provider.dart';
import 'package:todo/tasks_repository/state_tasks.dart';

import '../add_new_todo/add_new_todo.dart';

final Task_repository_RiverpodProvider =
    StateNotifierProvider<TaskRepositoryProvider, StateTasks>(
        (ref) => TaskRepositoryProvider());

var totalInboxTask = Map();
var totalTodayTask = Map();
var totalUpcomingTask = Map();
var totalNoTimeTask = Map();
var totalProjectsTask = Map();
var totalCounterProjectsTask = Map();
var totalColorsTask = Map();
var totalIconTask = Map();
var totalIconSearch = Map();

class TaskRepositoryProvider extends StateNotifier<StateTasks> {
  TaskRepositoryProvider()
      : super(
          StateTasks(
            '',
            0,
            0,
            0,
            0,
            null,
            null,
            Icons.radio_button_off,
          ),
        );

  int number = 1;

  void totalTasks(textTask, date, projects, color, icon) {
    {
      totalInboxTask[number] = '$textTask';
      if ('$date' == '$date_now') {
        totalTodayTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
      }
      if (date != date_now && date != null) {
        totalUpcomingTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
      }
      if (date == null) {
        totalNoTimeTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
      }
    }
    if ('$projects' != null) {
      totalProjectsTask[number] = projects;
      totalColorsTask[number] = color;
      totalIconTask[number] = icon;
    }
    if ('$projects' != null && totalCounterProjectsTask[projects] == null) {
      totalCounterProjectsTask[projects] = 1;
    } else {
      totalCounterProjectsTask[projects] += 1;
    }
    number += 1;

    state.inbox = totalInboxTask.length;
    state.today = totalTodayTask.length;
    state.upcoming = totalUpcomingTask.length;
    state.projects = totalProjectsTask.length;
    print('всего - $totalInboxTask');
    print('сегодня -$totalTodayTask');
    print('в планах - $totalUpcomingTask');
    print('Projects id - $totalProjectsTask');
    print('Projects  считает кол:- $totalCounterProjectsTask');
    print('Цвет Project - $totalColorsTask');
    print('Icon Project - $totalIconTask');
    print('нет времени - $totalNoTimeTask');
    print('иконки выполено или нет - $totalIconSearch');
  }

  int counter = 0;

  void changeCompletedIcon(String text) {
    print('Старое - $totalIconSearch');
    totalInboxTask.forEach(
      (key, value) {
        if (value == text) {
          print('$text');
          counter = key;
          if (totalIconSearch[counter] == Icons.radio_button_off) {
            totalIconSearch[counter] = Icons.check_circle;
          }
          else {
            totalIconSearch[counter] = Icons.radio_button_off;
          }
          print('Новое - $totalIconSearch');
        }
      },
    );
    print(counter);
    state = StateTasks(state.textTask, state.inbox, state.today, state.upcoming, state.projects, state.color, state.icon, Icons.radio_button_off);
  }
}
