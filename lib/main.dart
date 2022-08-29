import 'package:flutter/material.dart';

import 'package:todo/startScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
      home: StartScreen(),
    );
  }
}
