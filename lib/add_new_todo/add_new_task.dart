import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/add_provider.dart';
import 'package:todo/add_new_todo/data_task/task_overdue_repository.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/add_new_todo/inbox_provider.dart';
import '../colors.dart';

DateTime now = new DateTime.now();
DateTime date_now = new DateTime(now.year, now.month, now.day);

class AddNewTodo extends ConsumerWidget {
  AddNewTodo({Key? key}) : super(key: key);

  Future<void> selectDate(WidgetRef ref, context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date_now,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2101));
    ref.read(AddNewRiverpodProvider.notifier).setDate(picked);
  }

  void addTextField(WidgetRef ref, text) {
    ref.read(AddNewRiverpodProvider.notifier).addTextField(text);
  }

  void setDate(WidgetRef ref, date) {
    ref.read(AddNewRiverpodProvider.notifier).setDate(date);
  }

  void showInbox(context, WidgetRef ref) {
    ref.read(InboxRiverpodProvider.notifier).showInbox(context, ref);
  }

  void addTaskState(WidgetRef ref, textTask, date, project) {
    ref
        .read(AddNewRiverpodProvider.notifier)
        .addTaskState(textTask, date, project);
  }

  void getTasks(WidgetRef ref) {
    ref.watch(DataTasksRiverpodProvider.notifier).getTasks;
  }

  void addTasks(WidgetRef ref, task) {
    ref.watch(DataTasksRiverpodProvider.notifier).addTask(task);
  }

  void deleteTasks(WidgetRef ref, task) {
    ref.watch(DataTasksRiverpodProvider.notifier).deleteTask(task);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorSets.black,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: IconButton(
                    icon: Image.asset('images/close.png'),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 25),
                  child: Text(
                    'Add new todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    cursorColor: ColorSets.white,
                    style: TextStyle(fontSize: 16, color: ColorSets.white),
                    maxLines: 12,
                    minLines: 11,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      addTextField(ref, text);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: ColorSets.grey_text),
                      hintText: "Add text",
                      fillColor: ColorSets.gray,
                      filled: true,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => selectDate(ref, context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorSets.gray,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        margin: EdgeInsets.only(left: 20),
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                ref.watch(AddNewRiverpodProvider).date !=
                                            date_now &&
                                        ref
                                                .watch(AddNewRiverpodProvider)
                                                .date !=
                                            null
                                    ? 'images/upcoming.png'
                                    : ref.watch(AddNewRiverpodProvider).date ==
                                                date_now &&
                                            ref
                                                    .watch(
                                                        AddNewRiverpodProvider)
                                                    .date !=
                                                null
                                        ? 'images/today.png'
                                        : 'images/time.png',
                                width: 20,
                                height: 20),
                            Text(
                              ref.watch(AddNewRiverpodProvider).date !=
                                          date_now &&
                                      ref.watch(AddNewRiverpodProvider).date !=
                                          null
                                  ? '  Upcoming'
                                  : ref.watch(AddNewRiverpodProvider).date ==
                                              date_now &&
                                          ref
                                                  .watch(AddNewRiverpodProvider)
                                                  .date !=
                                              null
                                      ? '  Today'
                                      : '  No time',
                              style: TextStyle(
                                color: ref.watch(AddNewRiverpodProvider).date !=
                                        null
                                    ? ColorSets.white
                                    : ColorSets.grey_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showInbox(context, ref),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorSets.gray,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        margin: EdgeInsets.only(left: 20),
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle_rounded, size: 20, color: ref.watch(AddNewRiverpodProvider).color,),
                            Text(ref.watch(AddNewRiverpodProvider).project == null ? ' Inbox' : '  ${ref.watch(AddNewRiverpodProvider).project}',
                              style: TextStyle(
                                color: ref.watch(AddNewRiverpodProvider).project !=
                                    null
                                    ? ColorSets.white
                                    : ColorSets.grey_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: ref.watch(AddNewRiverpodProvider).textTask != null &&
                        ref.watch(AddNewRiverpodProvider).project != null
                    ? () {
                        addTaskState(
                            ref,
                            ref.watch(AddNewRiverpodProvider).textTask,
                            ref.watch(AddNewRiverpodProvider).date,
                            ref.watch(AddNewRiverpodProvider).project);
                        addTasks(ref, ref.watch(AddNewRiverpodProvider).taskDto);
                        ref.watch(DataTasksRiverpodProvider.notifier).getTasks;
                        Navigator.pushNamed(context, '/home');
                      }
                    : null,
                child: Text('ADD TODO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
