import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';


DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

final Date_RiverpodProvider = StateNotifierProvider((ref) => Date_Provider());

class Date_Provider extends StateNotifier<String> {
  Date_Provider() : super('   no date');


  Future<void> select_Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      state = '  Upcoming';
    }
    if (picked != null && picked == date){
      state = '  Today';
    };
  }
}
