import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Container(
        color: ColorSets.yellow,
        margin: EdgeInsets.only(right: 72),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 237),
            Center(
              child: Text('Alex \nMitchell', style: TextStyle(
                color: ColorSets.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),),
            )
          ],
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
                      leading: Image.asset('images/inbox.png'),
                      title: Text(
                        'Inbox',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '12',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      leading: Image.asset('images/today.png'),
                      title: Text(
                        'Today',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '4',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      leading: Image.asset('images/upcoming.png'),
                      title: Text(
                        'Upcoming',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '8',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 36, bottom: 16, right: 16),
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
                  color: ColorSets.gray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (20),
                    ),
                  ),
                ),
                height: 270,
                width: 500,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset('images/rectangle_yellow.png'),
                      title: Text(
                        'Personal',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '12',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      leading: Image.asset('images/rectangle_orange.png'),
                      title: Text(
                        'Work',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '4',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      leading: Image.asset('images/rectangle_purple.png'),
                      title: Text(
                        'Design',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '4',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Divider(color: ColorSets.white),
                    ),
                    ListTile(
                      leading: Image.asset('images/rectangle_green.png'),
                      title: Text(
                        'Study',
                        style: TextStyle(color: ColorSets.white),
                      ),
                      trailing: Text(
                        '8',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: (){},
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
