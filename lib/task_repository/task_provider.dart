import 'package:flutter_riverpod/flutter_riverpod.dart';

final Task_repository_RiverpodProvider = StateNotifierProvider((ref) => Task_repository_Provider());


class Task_repository_Provider extends StateNotifier<int?> {
  Task_repository_Provider() : super(1);


  var userInfo = new Map();
  int number = 1;
  void add_task(task) {
    {
      // var userInfo = new Map();
      userInfo[number] = '$task';
      number = ++number;
      print(userInfo.length);
      state = userInfo.length;

    }
  }
}
