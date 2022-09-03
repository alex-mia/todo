import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/tasks_repository/state_tasks.dart';

import '../add_new_todo/add_new_todo.dart';


final Task_repository_RiverpodProvider = StateNotifierProvider<Task_repository_Provider, State_Tasks>((ref) => Task_repository_Provider());



class Task_repository_Provider extends StateNotifier<State_Tasks> {
  Task_repository_Provider() : super(State_Tasks('', 0, 0, 0, 0, 0, 0, 0));

  var total_inbox_task = new Map();
  var total_today_task = new Map();
  var total_upcoming_task = new Map();
  var total_personal_task = new Map();
  var total_work_task = new Map();
  var total_design_task = new Map();
  var total_study_task = new Map();
  int number = 1;

  void total_tasks(text_task, date, projects) {
    {
      total_inbox_task[number] = '$text_task';
      if ('$date' == '$date_now'){
      total_today_task[number] = '$date';}
      else{total_upcoming_task[number] = '$date';}}
    if ('$projects' == '  Work'){
      total_work_task [number] = '$projects';}
    if ('$projects' == '  Personal'){
      total_personal_task [number] = '$projects';}
    if ('$projects' == '  Design'){
      total_design_task [number] = '$projects';}
    if ('$projects' == '  Study'){
      total_study_task [number] = '$projects';}

      number += 1;
      state.inbox = total_inbox_task.length;
      state.today = total_today_task.length;
      state.upcoming = total_upcoming_task.length;
      state.work = total_work_task.length;
      state.personal = total_personal_task.length;
      state.design = total_design_task.length;
      state.study = total_study_task.length;
      print('всего - $total_inbox_task');
      print('сегодня -$total_today_task');
      print('в планах - $total_upcoming_task');
    print('работа - $total_work_task');
    print('персональные - $total_personal_task');
    print('дизайн - $total_design_task');
    print('учеба - $total_study_task');
    }
  }

