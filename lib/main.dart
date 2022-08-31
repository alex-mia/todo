import 'package:flutter/material.dart';

import 'package:todo/startScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_new_todo/add_new_todo.dart';


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
        }
      // home: Add_new_todo(),
    );
  }
}
