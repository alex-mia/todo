import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/add_new_todo/data_task/task_overdue_repository.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/add_new_todo/data_task/task_today_repository.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Today extends ConsumerWidget {
  Today({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  void getTasks(WidgetRef ref) {
    ref.watch(DataTasksRiverpodProvider.notifier).getTasks;
  }

  void getOverdueTasks(WidgetRef ref) {
    ref.watch(DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
  }

  void addTasks(WidgetRef ref, task) {
    ref.watch(DataTasksRiverpodProvider.notifier).addTask(task);
  }

  void deleteTasks(WidgetRef ref, task) {
    ref.watch(DataTasksRiverpodProvider.notifier).deleteTask(task);
  }

  void updateIconChange(WidgetRef ref, task, iconChange) {
    ref.watch(DataTasksRiverpodProvider.notifier).updateTask(task, iconChange);
  }

  void updateOverdueIconChange(WidgetRef ref, task, iconChange) {
    ref.watch(DataTasksOverdueRiverpodProvider.notifier).updateOverdueTask(task, iconChange);
  }

  void updateTodayIconChange(WidgetRef ref, task, iconChange) {
    ref.watch(DataTasksTodayRiverpodProvider.notifier).updateTodayTask(task, iconChange);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(DataTasksOverdueRiverpodProvider);
    ref.watch(DataTasksTodayRiverpodProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Today'),
        backgroundColor: ColorSets.yellow,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            }),
      ),
      body: Container(
        constraints: BoxConstraints.expand(width: double.infinity, height: double.infinity),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 36, bottom: 10),
              child: Text(
                'OVERDUE',
                style: TextStyle(
                  color: ColorSets.grey_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints:
              BoxConstraints(maxWidth: double.infinity, maxHeight: 220),
              color: Colors.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: ref.watch(DataTasksOverdueRiverpodProvider).length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      deleteTasks(
                        ref,
                        ref.watch(DataTasksRiverpodProvider)[index],
                      );
                      ref
                          .watch(DataTasksRiverpodProvider.notifier)
                          .getTasks;
                    },
                    background: Container(
                      color: Colors.black,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(
                              Icons.delete_sweep,
                              color: Colors.red.shade700,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius:
                        BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      elevation: 5,
                      color: ColorSets.black,
                      shadowColor: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: InkWell(
                              child: Icon(
                                  ref.watch(DataTasksOverdueRiverpodProvider)[index].iconChange ==
                                      0
                                      ? Icons.circle_outlined
                                      : Icons.check_circle,
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                updateOverdueIconChange(
                                    ref,
                                    ref.watch(
                                        DataTasksOverdueRiverpodProvider)[index],
                                    ref
                                        .watch(DataTasksOverdueRiverpodProvider)[
                                    index]
                                        .iconChange);
                                ref
                                    .watch(
                                    DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
                                ref
                                    .watch(
                                    DataTasksRiverpodProvider.notifier).getTasks;

                                print(
                                    'Инсдекс - кнопки задачи ${ref.watch(DataTasksOverdueRiverpodProvider)[index].iconChange}');
                              },
                            ),
                            title: Text(
                              '${ref.watch(DataTasksOverdueRiverpodProvider)[index].textTask}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, bottom: 15),
                                child: Image.asset(ref.watch(DataTasksOverdueRiverpodProvider)[index].date != '$date_now'.hashCode
                                    && ref.watch(DataTasksOverdueRiverpodProvider)[index].date
                                        != 987444055
                                    ? 'images/upcoming.png'
                                    : ref.watch(DataTasksOverdueRiverpodProvider)[index].date ==
                                    '$date_now'.hashCode && ref.watch(DataTasksOverdueRiverpodProvider)[index].date !=
                                    987444055
                                    ? 'images/today.png'
                                    : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(ref.watch(DataTasksOverdueRiverpodProvider)[index].date != '$date_now'.hashCode
                                    && ref.watch(DataTasksOverdueRiverpodProvider)[index].date
                                        != 987444055
                                    ? '  Upcoming'
                                    : ref.watch(DataTasksOverdueRiverpodProvider)[index].date ==
                                    '$date_now'.hashCode && ref.watch(DataTasksOverdueRiverpodProvider)[index].date !=
                                    987444055
                                    ? '  Today'
                                    : '  No time',
                                  style: TextStyle(
                                    color: ColorSets.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 15),
                                child: Icon(Icons.circle,
                                    color: Color(
                                      int.parse(
                                          "${ref.watch(DataTasksOverdueRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),
                                    ),
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${ref.watch(DataTasksOverdueRiverpodProvider)[index].project}',
                                  style: TextStyle(
                                      color:
                                      '${ref.watch(DataTasksOverdueRiverpodProvider)[index].project}' !=
                                          null
                                          ? ColorSets.white
                                          : ColorSets.grey_text),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
              child: Text(
                'TODOS',
                style: TextStyle(
                  color: ColorSets.grey_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints:
              BoxConstraints(maxWidth: double.infinity, maxHeight: 290),
              color: Colors.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: ref.watch(DataTasksTodayRiverpodProvider).length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      deleteTasks(
                        ref,
                        ref.watch(DataTasksRiverpodProvider)[index],
                      );
                      ref
                          .watch(DataTasksRiverpodProvider.notifier)
                          .getTasks;
                    },
                    background: Container(
                      color: Colors.black,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(
                              Icons.delete_sweep,
                              color: Colors.red.shade700,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius:
                        BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      elevation: 5,
                      color: ColorSets.black,
                      shadowColor: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: InkWell(
                              child: Icon(
                                  ref.watch(DataTasksTodayRiverpodProvider)[index].iconChange ==
                                      0
                                      ? Icons.circle_outlined
                                      : Icons.check_circle,
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                updateIconChange(
                                    ref,
                                    ref.watch(
                                        DataTasksTodayRiverpodProvider)[index],
                                    ref
                                        .watch(DataTasksTodayRiverpodProvider)[
                                    index]
                                        .iconChange);
                                ref
                                    .watch(
                                    DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
                                ref
                                    .watch(
                                    DataTasksTodayRiverpodProvider.notifier).getTasksToday;
                                print(
                                    'Инсдекс - кнопки задачи ${ref.watch(DataTasksRiverpodProvider)[index].iconChange}');
                              },
                            ),
                            title: Text(
                              '${ref.watch(DataTasksTodayRiverpodProvider)[index].textTask}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, bottom: 15),
                                child: Image.asset(ref.watch(DataTasksTodayRiverpodProvider)[index].date != '$date_now'.hashCode
                                    && ref.watch(DataTasksTodayRiverpodProvider)[index].date
                                        != 987444055
                                    ? 'images/upcoming.png'
                                    : ref.watch(DataTasksTodayRiverpodProvider)[index].date ==
                                    '$date_now'.hashCode && ref.watch(DataTasksTodayRiverpodProvider)[index].date !=
                                    987444055
                                    ? 'images/today.png'
                                    : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(ref.watch(DataTasksTodayRiverpodProvider)[index].date != '$date_now'.hashCode
                                    && ref.watch(DataTasksTodayRiverpodProvider)[index].date
                                        != 987444055
                                    ? '  Upcoming'
                                    : ref.watch(DataTasksTodayRiverpodProvider)[index].date ==
                                    '$date_now'.hashCode && ref.watch(DataTasksTodayRiverpodProvider)[index].date !=
                                    987444055
                                    ? '  Today'
                                    : '  No time',
                                  style: TextStyle(
                                    color: ColorSets.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 15),
                                child: Icon(Icons.circle,
                                    color: Color(
                                      int.parse(
                                          "${ref.watch(DataTasksTodayRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),
                                    ),
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${ref.watch(DataTasksTodayRiverpodProvider)[index].project}',
                                  style: TextStyle(
                                      color:
                                      '${ref.watch(DataTasksTodayRiverpodProvider)[index].project}' !=
                                          null
                                          ? ColorSets.white
                                          : ColorSets.grey_text),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
