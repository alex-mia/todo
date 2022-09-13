import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/add_projects_provider.dart';
import 'package:todo/tasks_repository/state_tasks.dart';

import '../add_new_todo/add_new_todo.dart';


final Task_repository_RiverpodProvider = StateNotifierProvider<TaskRepositoryProvider, StateTasks>((ref) => TaskRepositoryProvider());


var totalInboxTask =  Map();
var totalTodayTask = Map();
var totalUpcomingTask = Map();
var totalNoTimeTask = Map();
var totalProjectsTask = Map();
var totalCounterProjectsTask = Map();
var totalColorsTask = Map();
var totalIconTask = Map();


class TaskRepositoryProvider extends StateNotifier<StateTasks> {
  TaskRepositoryProvider() : super(StateTasks(
      '',
      0,
      0,
      0,
      0,
      null,
      null));

  int number = 1;
  int counter = 1;


  void totalTasks(textTask, date, projects, color, icon) {
    {
      totalInboxTask[number] = '$textTask';
      if ('$date' == '$date_now') {
        totalTodayTask[number] = '$textTask';
      }
      if (date != date_now && date != null) {
        totalUpcomingTask[number] = '$textTask';
      }
      if (date == null) {
        totalNoTimeTask[number] = '$textTask';
      }
    }
    if ('$projects' != null) {
      totalProjectsTask [number] = projects;
      totalColorsTask [number] = color;
      totalIconTask [ number] = icon;
    }
    if ('$projects' != null && totalCounterProjectsTask[projects] == null) {
      totalCounterProjectsTask[projects] = 1;}
    else {
      totalCounterProjectsTask[projects] += 1;
      // counter = counter + 1;
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
    }
  }


