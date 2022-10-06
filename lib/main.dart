import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/add_new_task.dart';
import 'package:todo/home.dart';
import 'package:todo/inbox/inbox.dart';
import 'package:todo/projects/addNewProjects.dart';
import 'package:todo/projects/filterProjects.dart';
import 'package:todo/projects/projects.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/search/searchTasks.dart';
import 'package:todo/startScreen.dart';
import 'package:todo/today/today.dart';
import 'package:todo/upcoming/upcoming.dart';

void main()  {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
        initialRoute: '/',
        routes: {
          '/':(BuildContext context) => StartScreen(),
          '/add_projects':(BuildContext context) => AddNewProjects(),
          '/projects':(BuildContext context) => Projects (),
          '/add':(BuildContext context) => AddNewTodo(),
          '/home': (BuildContext context) => Home(),
          // '/home_add': (BuildContext context) => HomeAdd(),
          '/inbox': (BuildContext context) => Inbox(),
          '/today': (BuildContext context) => Today(),
          '/upcoming': (BuildContext context) => Upcoming(),
          '/filters_projects':(BuildContext context) => FilterProjects(),
          '/search':(BuildContext context) => SearchTask(),
        }
      // home: Add_new_todo(),
    );
  }
}
