import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/tasks_repository/total_tasks_provider.dart';
import '../projects/add_projects_provider.dart';
import 'home.dart';

class Home_add extends ConsumerWidget {
  const Home_add({Key? key}) : super(key: key);


  void setProjects(WidgetRef ref, text) {
    ref.read(AddProjects_RiverpodProvider.notifier).setProjects(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
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
                  onTap: () {Navigator.pushNamed(context, '/projects');
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
        padding: EdgeInsets.only(right: 16, left: 16, top: 5),
        height: double.infinity,
        width: double.infinity,
        color: ColorSets.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(

                  height: 30,
                  width: 320,
                  decoration: BoxDecoration(
                    color: ColorSets.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Icon(
                          Icons.add_task,
                          color: Colors.green,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Task added in ${ref.watch(AddProjects_RiverpodProvider).text}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        autofocus: true,
                          icon: const Icon(Icons.close_outlined, color: Colors.black, size: 17, ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, top: 3),
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
                      onTap: () {Navigator.pushNamed(context, '/inbox');},
                      leading: Image.asset('images/inbox.png'),
                      title: Text(
                        'Inbox',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(Task_repository_RiverpodProvider).inbox}'),
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      onTap: () {Navigator.pushNamed(context, '/today');},
                      leading: Image.asset('images/today.png'),
                      title: Text(
                        'Today',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(Task_repository_RiverpodProvider).today}'),
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      onTap: () {Navigator.pushNamed(context, '/upcoming');},
                      leading: Image.asset('images/upcoming.png'),
                      title: Text(
                        'Upcoming',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        ('${ref.watch(Task_repository_RiverpodProvider).upcoming}'),
                        style: TextStyle(color: ColorSets.grey_text),
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
                constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: 300),
                decoration: BoxDecoration(
                  color: ColorSets.gray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (20),
                    ),
                  ),
                ),
                child: ListView.builder(
                  itemCount: allProjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(1),
                      color: ColorSets.gray,
                      shadowColor: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/filters_projects');
                              setProjects(ref, allProjects[index + 1]);
                            },
                            trailing: Text(
                            '${totalCounterProjectsTask[allProjects[index + 1]] == null ? '0' : totalCounterProjectsTask[allProjects[index + 1]]}',
                            style: TextStyle(color: Colors.white),
                          ),
                            leading: Icon(Icons.circle_sharp,
                                size: 14,
                                color: colorProjects[index+1]),
                            title: Text(
                              '${allProjects[index+1]}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
