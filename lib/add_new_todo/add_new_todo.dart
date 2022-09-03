import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../colors.dart';
import '../tasks_repository/total_tasks_provider.dart';
import 'add_provider.dart';
import 'inbox_provider.dart';

DateTime now = new DateTime.now();
DateTime date_now = new DateTime(now.year, now.month, now.day);

class Add_new_todo extends ConsumerWidget {
  Add_new_todo({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  void validateTextField(WidgetRef ref, text) {
    ref.read(Add_new_RiverpodProvider.notifier).validateTextField(text);
  }

  Future<void> selectDate(WidgetRef ref, context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:  date_now,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2101));
    ref.read(Add_new_RiverpodProvider.notifier).setDate(picked);
  }

  void show_inbox(WidgetRef ref, context) {
    ref.read(Inbox_RiverpodProvider.notifier).show_inbox(context);
  }

  void add_task(WidgetRef ref, text_task, date, projects) {
    ref.read(Task_repository_RiverpodProvider.notifier).total_tasks(text_task, date, projects);
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
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: IconButton(
                    icon: Image.asset('images/close.png'),
                    iconSize: 50,
                    onPressed: () {Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 53),
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
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: ColorSets.white,
                    style: TextStyle(fontSize: 16, color: ColorSets.white),
                    maxLines: 12,
                    minLines: 11,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      validateTextField(ref, text);
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
                                ref.watch(Add_new_RiverpodProvider).date !=
                                        date_now && ref.watch(Add_new_RiverpodProvider).date != null
                                    ? 'images/upcoming.png'
                                    : ref.watch(Add_new_RiverpodProvider).date ==
                                    date_now && ref.watch(Add_new_RiverpodProvider).date != null
                                    ? 'images/today.png'
                                        : 'images/time.png',
                                width: 20,
                                height: 20),
                            Text(
                              ('${ref.watch(Add_new_RiverpodProvider).timing}'),
                              style: TextStyle(
                               color:
    ref.watch(Add_new_RiverpodProvider).date !=
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
                      onTap: () => show_inbox(ref, context),
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
                                '${ref.watch(Inbox_RiverpodProvider)}' ==
                                        '  Personal'
                                    ? 'images/rectangle_yellow.png'
                                    : '${ref.watch(Inbox_RiverpodProvider)}' ==
                                            '  Work'
                                        ? 'images/rectangle_orange.png'
                                        : '${ref.watch(Inbox_RiverpodProvider)}' ==
                                                '  Design'
                                            ? 'images/rectangle_purple.png'
                                            : '${ref.watch(Inbox_RiverpodProvider)}' ==
                                                    '  Study'
                                                ? 'images/rectangle_green.png'
                                                : 'images/inbox.png',
                                width: 20,
                                height: 20),
                            Text(
                              '${ref.watch(Inbox_RiverpodProvider)}',
                              style: TextStyle(
                                  color:
                                      '${ref.watch(Inbox_RiverpodProvider)}' !=
                                              '  Inbox'
                                          ? ColorSets.white
                                          : ColorSets.grey_text),
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
                onPressed: ref.watch(Add_new_RiverpodProvider).hasText == true
                    ? () {
                        add_task(ref, ref.watch(Add_new_RiverpodProvider).text, ref.watch(Add_new_RiverpodProvider).date, ref.watch(Inbox_RiverpodProvider) );
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
