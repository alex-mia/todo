import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/autorization/signIn.dart';
import 'package:todo/autorization/signUp.dart';

import '../colors.dart';
import '../home.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: ColorSets.black,
      body: Center(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 180,
                ),
                Image.asset('images/logo.png'),
                SizedBox(
                  height: 146,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(60, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text('SIGN IN'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(60, 40),
                          primary: ColorSets.gray,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(color: ColorSets.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 40),
                  child: Container(
                    color: ColorSets.gray,
                    height: 2,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: 230,
                  width: 400,
                  child: ListView(
                    padding: EdgeInsets.only(top: 0),
                    controller: _scrollController,
                    children: [
                      GestureDetector(
                        onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSets.gray,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/google.png'),
                              Text(
                                "   CONTINUE WITH GOOGLE",
                                style: TextStyle(
                                  color: ColorSets.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSets.gray,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/apple.png'),
                              Text(
                                "   CONTINUE WITH APPLE",
                                style: TextStyle(
                                  color: ColorSets.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSets.gray,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/facebook.png'),
                              Text(
                                "   CONTINUE WITH FACEBOOK",
                                style: TextStyle(
                                  color: ColorSets.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}