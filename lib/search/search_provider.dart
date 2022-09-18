import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tasks_repository/total_tasks_provider.dart';

final Search_Provider_RiverpodProvider =
    StateNotifierProvider((ref) => Search_Provider());

List totalSearchTask = [];

class Search_Provider extends StateNotifier<int> {
  Search_Provider() : super(0);

  void validDateSearch(String? text) {
    totalSearchTask = [];
    int number = 1;
    while (totalInboxTask.length >= number) {
      if (text != null && totalInboxTask[number].contains(text) == true) {
        totalSearchTask.add(number);
      }
      number += 1;
    }
    state = totalSearchTask.length;
  }
}
