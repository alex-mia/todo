import 'package:flutter/material.dart';
import 'package:todo/projects/addNewProjects.dart';
import 'package:todo/projects/projects.dart';

import 'package:todo/startScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/tasks_repository/home.dart';
import 'package:todo/tasks_repository/home_add.dart';
import 'package:todo/today/today.dart';
import 'package:todo/upcoming/upcoming.dart';

import 'add_new_todo/add_new_todo.dart';
import 'inbox/inbox.dart';


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
          '/add':(BuildContext context) => Add_new_todo(),
          '/home': (BuildContext context) => Home(),
          '/home_add': (BuildContext context) => Home_add(),
          '/inbox': (BuildContext context) => Inbox(),
          '/today': (BuildContext context) => Today(),
          '/upcoming': (BuildContext context) => Upcoming(),
          '/projects':(BuildContext context) => Projects (),
          '/add_projects':(BuildContext context) => AddNewProjects(),
        }
      // home: Add_new_todo(),
    );
  }
}
