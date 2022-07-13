import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: ColorSets.yellow,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(right: 16, left: 16),
        color: ColorSets.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16,bottom: 10),
                child: Text(
                  "NAME",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSets.grey_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16,bottom: 10),
                child: Text(
                  "EMAIL",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSets.grey_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16,bottom: 10),
                child: Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSets.grey_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 220,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(60, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {},
                        child: Text('SIGN UP'),
                      ),
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
