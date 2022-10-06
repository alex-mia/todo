import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/data_task/task.dart';
import 'package:todo/projects/data_project/project.dart';

class StateTasks {
  int? iconChange;
  String? textTask;
  DateTime? date;
  Color? color;
  String? project;
  TaskDto? taskDto;

  StateTasks(
      this.iconChange,
      this.textTask,
      this.date,
      this.color,
      this.project,
      this.taskDto,
  );
}
