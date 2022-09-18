import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo/projects/state_projects.dart';

import '../tasks_repository/total_tasks_provider.dart';

Map allProjects = {};
Map colorProjects = {};

final AddProjects_RiverpodProvider = StateNotifierProvider<AddProjects_Provider, StateProjects>((ref) => AddProjects_Provider());

class AddProjects_Provider extends StateNotifier<StateProjects> {
  AddProjects_Provider()
      : super(StateProjects(false, null, null, Icons.circle_rounded));


  void textProjects(String text) {
    state = StateProjects(text.isNotEmpty, text, state.color, state.icon);
  }

  void dataPocessingColorIcon(Color color, IconData icon) {
    if (icon == Icons.circle_rounded) {
      icon = Icons.check_circle;
    } else {
      icon = Icons.circle_rounded;
    }
    state = StateProjects(state.hasText, state.text, color, icon);
  }

  int number = 1;

  void addProjects(String text, Color color) {
    allProjects[number] = text;
    colorProjects[number] = color;
    number += 1;
    print('Ключи проектов - $allProjects');
    print('$colorProjects');
  }

  void setProjects(String text){
    state = StateProjects(state.hasText, text, state.color, state.icon);
  }

}
