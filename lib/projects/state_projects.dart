import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo/projects/data_project/project.dart';

class Project {
  String? text;
  Color? color;
  IconData? icon;
  ProjectDto? projectDto;

  Project(this.text, this.color, this.icon, this.projectDto);
}