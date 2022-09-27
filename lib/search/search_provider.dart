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
    int counter = 0;
    while (totalInboxTaskKey.length >= number) {
      if (text != null && totalInboxTask[totalInboxTaskKey[counter]].contains(text) == true) {
        totalSearchTask.add(number);
      }
      number += 1;
      counter += 1;
    }
    state = totalSearchTask.length;
  }
}
