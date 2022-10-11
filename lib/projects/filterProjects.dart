import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/home.dart';
import 'package:todo/projects/data_project/task_projects_filter_repository.dart';



class FilterProjects extends ConsumerWidget {
  FilterProjects({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  // List totalTodayTaskKey = totalTodayTask.keys.toList();
  // List totalNoTimeTaskKey = totalNoTimeTask.keys.toList();

  void updateIconChange(WidgetRef ref, task, iconChange) {
    ref.watch(DataTasksRiverpodProvider.notifier).updateTask(task, iconChange);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(projects),
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
        color: ColorSets.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
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
              BoxConstraints(maxWidth: double.infinity, maxHeight: 580),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: ref.watch(DataTasksFilterProjectRiverpodProvider).length,
                itemBuilder: (BuildContext context, int index) {
                    return  Card(
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
                                  ref.watch(DataTasksFilterProjectRiverpodProvider)[index].iconChange ==
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
                                        DataTasksFilterProjectRiverpodProvider)[index],
                                    ref
                                        .watch(DataTasksFilterProjectRiverpodProvider)[
                                    index]
                                        .iconChange);
                                ref
                                    .watch(
                                    DataTasksFilterProjectRiverpodProvider.notifier).getTasksFilterProject;
                                print(
                                    'Инсдекс - кнопки задачи ${ref.watch(DataTasksRiverpodProvider)[index].iconChange}');
                              },
                            ),
                            title: Text(
                              '${ref.watch(DataTasksFilterProjectRiverpodProvider)[index].textTask}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, bottom: 15),
                                child: Image.asset(ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date != date_now.day
                                    && ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date
                                        != 0
                                    ? 'images/upcoming.png'
                                    : ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date ==
                                    date_now.day && ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date !=
                                    0
                                    ? 'images/today.png'
                                    : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date != date_now.day
                                    && ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date
                                        != 0
                                    ? '  Upcoming'
                                    : ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date ==
                                    date_now.day && ref.watch(DataTasksFilterProjectRiverpodProvider)[index].date !=
                                    0
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
                                          "${ref.watch(DataTasksFilterProjectRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),
                                    ),
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${ref.watch(DataTasksFilterProjectRiverpodProvider)[index].project}',
                                  style: TextStyle(
                                      color:
                                      '${ref.watch(DataTasksFilterProjectRiverpodProvider)[index].project}' !=
                                          null
                                          ? ColorSets.white
                                          : ColorSets.grey_text),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
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