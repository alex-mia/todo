import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/signIn.dart';
import 'package:todo/signUp.dart';
import 'package:todo/startScreen.dart';

import 'authorization.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
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
