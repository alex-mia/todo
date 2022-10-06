import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/add_new_todo/data_task/task_search_repository.dart';
import 'package:todo/projects/data_project/task_projects_filter_repository.dart';
import 'package:todo/search/search_provider.dart';
import '../colors.dart';

String textTask = '';

class SearchTask extends ConsumerWidget {
  SearchTask({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  void validDateSearch(WidgetRef ref, text) {
    ref.read(SearchProviderRiverpodProvider.notifier).validDateSearch(text);
  }

  void updateIconChange(WidgetRef ref, task, iconChange) {
    ref.watch(DataTasksRiverpodProvider.notifier).updateTask(task, iconChange);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorSets.black,
      body: Column(children: [
      Row(
      children: [
      Padding(
      padding: const EdgeInsets.only(left: 25, top: 60),
      child: Container(
        width: 250,
        height: 45,
        child: TextField(
          cursorColor: ColorSets.white,
          style: TextStyle(fontSize: 16, color: ColorSets.white),
          maxLines: 1,
          minLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (text) {
            validDateSearch(ref, text);
            textTask = '${ref.watch(SearchProviderRiverpodProvider)}';
            ref.watch(DataTasksSearchRiverpodProvider.notifier).getTasksSearch;
          },
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintStyle: TextStyle(color: ColorSets.white, fontSize: 20),
            hintText: "🔍 ",
            fillColor: ColorSets.gray,
            filled: true,
          ),
        ),
      ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 20, top: 60),
    child: GestureDetector(
    onTap: () {
    Navigator.pop(context, '/home');
    },
    child: Text(
    'Cancel',
    style: TextStyle(
    color: Colors.grey,
    fontSize: 14,
    ),
    ),
    ),
    ),
    ],
    ),
                        Column(
                          children: [
                            Container(
                              width: 350,
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, maxHeight: 380),
                              color: ColorSets.black,
                              child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: ref
                                      .watch(
                                      DataTasksSearchRiverpodProvider)
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            20.0), //<-- SEE HERE
                                      ),
                                      elevation: 5,
                                      color: ColorSets.black,
                                      shadowColor: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ListTile(
                                            leading: InkWell(
                                              child: Icon(
                                                  ref
                                                              .watch(DataTasksSearchRiverpodProvider)[
                                                                  index]
                                                              .iconChange ==
                                                          0
                                                      ? Icons.circle_outlined
                                                      : Icons.check_circle,
                                                  color: Colors.grey),
                                              highlightColor: Colors.deepOrange,
                                              radius: 10.0,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              onTap: () {
                                                updateIconChange(
                                                    ref,
                                                    ref.watch(
                                                            DataTasksSearchRiverpodProvider)[
                                                        index],
                                                    ref
                                                        .watch(DataTasksSearchRiverpodProvider)[
                                                            index]
                                                        .iconChange);
                                                ref
                                                    .watch(
                                                        DataTasksSearchRiverpodProvider
                                                            .notifier)
                                                    .getTasksSearch;

                                                print(
                                                    'Инсдекс - кнопки задачи ${ref.watch(DataTasksRiverpodProvider)[index].iconChange}');
                                              },
                                            ),
                                            title: Text(
                                              '${ref.watch(DataTasksSearchRiverpodProvider)[index].textTask}',
                                              style: TextStyle(
                                                  color: ColorSets.white),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50, bottom: 15),
                                                child: Image.asset(
                                                    ref
                                                                    .watch(DataTasksSearchRiverpodProvider)[
                                                                        index]
                                                                    .date !=
                                                                '$date_now'
                                                                    .hashCode &&
                                                            ref
                                                                    .watch(DataTasksSearchRiverpodProvider)[
                                                                        index]
                                                                    .date !=
                                                                987444055
                                                        ? 'images/upcoming.png'
                                                        : ref
                                                                        .watch(DataTasksSearchRiverpodProvider)[
                                                                            index]
                                                                        .date ==
                                                                    '$date_now'
                                                                        .hashCode &&
                                                                ref
                                                                        .watch(DataTasksSearchRiverpodProvider)[
                                                                            index]
                                                                        .date !=
                                                                    987444055
                                                            ? 'images/today.png'
                                                            : 'images/time.png',
                                                    width: 20,
                                                    height: 20),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Text(
                                                  ref
                                                                  .watch(DataTasksSearchRiverpodProvider)[
                                                                      index]
                                                                  .date !=
                                                              '$date_now'
                                                                  .hashCode &&
                                                          ref
                                                                  .watch(DataTasksSearchRiverpodProvider)[
                                                                      index]
                                                                  .date !=
                                                              987444055
                                                      ? '  Upcoming'
                                                      : ref
                                                                      .watch(DataTasksSearchRiverpodProvider)[
                                                                          index]
                                                                      .date ==
                                                                  '$date_now'
                                                                      .hashCode &&
                                                              ref
                                                                      .watch(DataTasksSearchRiverpodProvider)[
                                                                          index]
                                                                      .date !=
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
                                                          "${ref.watch(DataTasksSearchRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),
                                                    ),
                                                    size: 20),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Text(
                                                  '  ${ref.watch(DataTasksSearchRiverpodProvider)[index].project}',
                                                  style: TextStyle(
                                                      color:
                                                          '${ref.watch(DataTasksSearchRiverpodProvider)[index].project}' !=
                                                                  null
                                                              ? ColorSets.white
                                                              : ColorSets
                                                                  .grey_text),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
  ],
                      ),
                );

  }
}
