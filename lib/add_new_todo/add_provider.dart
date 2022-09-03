import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/add_new_todo.dart';
import 'package:todo/add_new_todo/state_add.dart';

final Add_new_RiverpodProvider = StateNotifierProvider<Add_new_Provider, StateAdd>((ref) => Add_new_Provider());

class Add_new_Provider extends StateNotifier<StateAdd> {
  Add_new_Provider() : super(StateAdd(false, null, null, '  No date'));

  void setDate(DateTime? date) {
    if (date != date_now && date != null){
      state.timing = '  Upcoming';}
      if (date == date_now && date != null){
        state.timing = '  Today';}
    state = StateAdd(state.hasText, state.text, date, state.timing);
  }

  void validateTextField(String text) {
      state = StateAdd(text.isNotEmpty, text, state.date, state.timing);
    }
  }


