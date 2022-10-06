import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/add_provider.dart';
import 'package:todo/add_new_todo/state_tasks.dart';
import 'package:todo/colors.dart';
import 'package:todo/projects/data_project/project_repository.dart';

final InboxRiverpodProvider = StateNotifierProvider<InboxProvider, StateTasks>((ref) => InboxProvider());

class InboxProvider extends StateNotifier<StateTasks> {
  InboxProvider() : super(StateTasks(null, null, null, null, null, null));

  final ScrollController _scrollController = ScrollController();

  void setProject(WidgetRef ref, project, color) {
    ref.read(AddNewRiverpodProvider.notifier).setProject(project, color);

  }

  void showInbox(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: ColorSets.gray,
      context: context,
      builder: (context) =>
          Container(
            width: 300,
            height: 400,
            color: ColorSets.gray,
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Text(
                        '  Projects',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorSets.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: ColorSets.white),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                          'images/inbox.png', width: 20, height: 20),
                    ),
                    Text(
                      'Inbox',
                      style: TextStyle(
                        color: ColorSets.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Divider(color: ColorSets.white),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        (20),
                      ),
                    ),
                  ),
                  height: 275,
                  width: 375,
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: ref
                        .watch(DataProjectsRiverpodProvider)
                        .length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 3,
                          color: Colors.white,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 6,
                        margin: EdgeInsets.zero,
                        color: ColorSets.gray,
                        shadowColor: Colors.white,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setProject(ref, '${ref.watch(
                                    DataProjectsRiverpodProvider)[index]
                                    .text}', Color(int.parse("${ref.watch(
                                    DataProjectsRiverpodProvider)[index]
                                    .color!
                                    .replaceAll('Color(', '')
                                    .replaceAll(
                                    ')', '')}"),),);
                              },
                              child: ListTile(
                                leading: Icon(Icons.circle_rounded,
                                  size: 14,
                                  color: Color(int.parse("${ref.watch(
                                      DataProjectsRiverpodProvider)[index]
                                      .color!
                                      .replaceAll('Color(', '')
                                      .replaceAll(
                                      ')', '')}"),),),
                                title: Text(
                                  '${ref.watch(
                                      DataProjectsRiverpodProvider)[index]
                                      .text}',
                                  style: TextStyle(color: ColorSets.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}