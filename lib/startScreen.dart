import 'dart:async';

import 'package:flutter/material.dart';

import 'authorization.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Authorization()));}
    );
  }

  @override
  Widget build(BuildContext context) {
    Size sazes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 214, 10, 1),
      body: Container(
      child: Stack(
       alignment: AlignmentDirectional.center,
      children: [
      Positioned(
        child: Image.asset('images/vector.png',
          fit: BoxFit.cover,
          height: sazes.height,
          width: sazes.width,
        ),//Icon
      ), //Positioned
      Positioned(
      child: Image.asset('images/logo.png'),
    ),
    ]
    )
    ),
    );
  }
}
