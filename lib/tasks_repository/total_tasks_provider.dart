import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/tasks_repository/state_tasks.dart';

import '../add_new_todo/add_new_todo.dart';

final Task_repository_RiverpodProvider =
StateNotifierProvider<TaskRepositoryProvider, StateTasks>(
        (ref) => TaskRepositoryProvider());

List totalInboxTaskKey = [];
List totalNoTimeTaskKey = [];
List totalTodayTaskKey = [];
List totalUpcomingTaskKey = [];
List totalProjectsTaskKey = [];

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
      [],
    ),
  );

  int number = 1;

  void totalTasks(textTask, date, projects, color, icon) {
    {
      totalInboxTaskKey.add(number);
      totalInboxTask[number] = '$textTask';
      if ('$date' == '$date_now') {
        totalTodayTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
        totalTodayTaskKey.add(number);
      }
      if (date != date_now && date != null) {
        totalUpcomingTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
        totalUpcomingTaskKey.add(number);
      }
      if (date == null) {
        totalNoTimeTask[number] = '$textTask';
        totalIconSearch[number] = Icons.radio_button_off;
        totalNoTimeTaskKey.add(number);
      }
    }
    if ('$projects' != null) {
      totalProjectsTask[number] = projects;
      totalColorsTask[number] = color;
      totalIconTask[number] = icon;
      totalProjectsTaskKey.add(number);
    }
    if ('$projects' != null && totalCounterProjectsTask[projects] == null) {
      totalCounterProjectsTask[projects] = 1;
    } else {
      totalCounterProjectsTask[projects] += 1;
    }
    number += 1;

    int inbox = totalInboxTaskKey.length;
    int today = totalTodayTaskKey.length;
    int upcoming = totalUpcomingTaskKey.length;
    int project = totalProjectsTaskKey.length;
    state = StateTasks(state.textTask, inbox, today, upcoming, project, state.color, state.icon, Icons.radio_button_off,  totalInboxTaskKey);

    print('всего - $totalInboxTask');
    print('сегодня -$totalTodayTask');
    print('в планах - $totalUpcomingTask');
    print('Projects id - $totalProjectsTask');
    print('Projects  считает кол:- $totalCounterProjectsTask');
    print('Цвет Project - $totalColorsTask');
    print('Icon Project - $totalIconTask');
    print('нет времени - $totalNoTimeTask');
    print('иконки выполено или нет - $totalIconSearch');
    print('ключи задач всего -   $totalInboxTaskKey');
    print('ключи задач нет времени -   $totalNoTimeTaskKey');
    print('ключи задач сегодня -   $totalTodayTaskKey');
    print('ключи задач будущее -   $totalUpcomingTaskKey');
    print('ключи задач проектов -   $totalProjectsTaskKey');
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
    state = StateTasks(state.textTask, state.inbox, state.today, state.upcoming, state.projects, state.color, state.icon, Icons.radio_button_off,  totalInboxTaskKey);
  }

  void deletTask(int taskKey, String projects){
    print('текст задачи удаление - $taskKey');
      if (taskKey != null) {
        totalInboxTaskKey.remove(taskKey);
        totalNoTimeTaskKey.remove(taskKey);
        totalTodayTaskKey.remove(taskKey);
        totalUpcomingTaskKey.remove(taskKey);
        totalProjectsTaskKey.remove(taskKey);
      }
    int projectsKey = totalCounterProjectsTask[projects];
    projectsKey = projectsKey - 1;
    print('новое значение количество  $projectsKey');
      print('Текст что удалять с проекта $projects');
    totalCounterProjectsTask[projects] =  projectsKey;
    print('${totalInboxTaskKey}');
    int inbox = totalInboxTaskKey.length;
    int today = totalTodayTaskKey.length;
    int upcoming = totalUpcomingTaskKey.length;
    int project = totalProjectsTaskKey.length;
    state = StateTasks(state.textTask, inbox, today, upcoming, project, state.color, state.icon, Icons.radio_button_off,  totalInboxTaskKey);
  }
}