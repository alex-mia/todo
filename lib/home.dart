import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/add_new_todo/data_task/task_overdue_repository.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/add_new_todo/data_task/task_today_repository.dart';
import 'package:todo/add_new_todo/data_task/task_upcoming_repository.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/data_project/project_repository.dart';
import 'package:todo/projects/data_project/task_projects_filter_repository.dart';

String projects = '';

class Home extends ConsumerWidget {
   Home({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(DataTasksOverdueRiverpodProvider);
    ref.watch(DataTasksTodayRiverpodProvider);
    ref.watch(DataTasksFilterProjectRiverpodProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      drawer: Center(
        child: Container(
          color: ColorSets.yellow,
          margin: EdgeInsets.only(right: 75),
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: ColorSets.gray,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.only(top: 145),
                  child: Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: ColorSets.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Alex \nMitchell',
                  style: TextStyle(
                    color: ColorSets.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    print("Prodectivity");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/productivity.png'),
                      Text(
                        "    Productivity",
                        style: TextStyle(
                            color: ColorSets.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/projects');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/projects.png'),
                      Text(
                        "    Projects",
                        style: TextStyle(
                            color: ColorSets.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    print("Settings");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/settings.png'),
                      Text(
                        "    Settings",
                        style: TextStyle(
                            color: ColorSets.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 63),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Sing Out");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/sign_out.png'),
                              Text(
                                "    Sign Out",
                                style: TextStyle(
                                    color: ColorSets.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 16, left: 16, top: 32),
        height: double.infinity,
        width: double.infinity,
        color: ColorSets.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          // Text('Task added in ',
          //   overflow: TextOverflow.ellipsis,
          // ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Hello Alex! 👋',
                  style: TextStyle(
                    color: ColorSets.white,
                    fontSize: 22,
                  ),
                ),
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
                height: 200,
                width: 500,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
              Navigator.pushNamed(context, '/inbox');
              ref.watch(DataTasksRiverpodProvider.notifier).getTasks;
              ref.watch(DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
              },
                      leading: Image.asset('images/inbox.png'),
                      title: Text(
                        'Inbox',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(DataTasksRiverpodProvider).length}'),
                        style: TextStyle(color: ColorSets.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/today');
                        ref.watch(DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
                        ref.watch(DataTasksTodayRiverpodProvider.notifier).getTasksToday;
                      },
                      leading: Image.asset('images/today.png'),
                      title: Text(
                        'Today',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(DataTasksTodayRiverpodProvider).length}'),
                        style: TextStyle(color: ColorSets.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/upcoming');
                        ref.watch(DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
                        ref.watch(DataTasksUpcomingRiverpodProvider.notifier).getTasksUpcoming;
                      },
                      leading: Image.asset('images/upcoming.png'),
                      title: Text(
                        'Upcoming',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(DataTasksUpcomingRiverpodProvider).length}'),
                        style: TextStyle(color: ColorSets.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 36, bottom: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROJECTS',
                      style: TextStyle(color: ColorSets.grey_text),
                    ),
                    Icon(Icons.keyboard_arrow_up, color: ColorSets.grey_text),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (20),
                    ),
                  ),
                  color:  ColorSets.black,
                ),
                height: 280,
                width: 490,
                // color: ColorSets.black,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      controller: _scrollController,
                      itemCount: ref.watch(DataProjectsRiverpodProvider).length,
                      separatorBuilder: (BuildContext context, int index) => Divider(
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
                              ListTile(
                                onTap: () {
                                  projects = '${ref.watch(DataProjectsRiverpodProvider)[index].text}';
                                  ref.watch(DataTasksFilterProjectRiverpodProvider.notifier).getTasksFilterProject;
                                  Navigator.pushNamed(context, '/filters_projects');
                                },
                                leading: Icon(Icons.circle_rounded,
                                  size: 14,
                                  color: Color(int.parse("${ref.watch(DataProjectsRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),),),
                                title: Text(
                                  '${ref.watch(DataProjectsRiverpodProvider)[index].text}',
                                  style: TextStyle(color: ColorSets.white),
                                ),
                          trailing: Text(
                            ('${ref.watch(DataTasksFilterProjectRiverpodProvider).length}'),
                            style: TextStyle(color: ColorSets.white),
                              ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add');
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
