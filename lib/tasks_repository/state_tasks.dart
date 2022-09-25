import 'package:flutter/material.dart';

class StateTasks {
  String textTask;
  int? inbox;
  int? today;
  int? upcoming;
  int? projects;
  Color? color;
  Icon? icon;
  IconData? iconChange;
  List taskKey;



  StateTasks(
    this.textTask,
    this.inbox,
      this.today,
      this.upcoming,
      this.projects,
      this.color,
      this.icon,
      this.iconChange,
      this.taskKey,
  );
}
