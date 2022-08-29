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
      drawer:
      Center(
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
                    child: Text('A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: ColorSets.white,
                    ),),
                  ),
                ),
                SizedBox(height: 12),
                Text('Alex \nMitchell', style: TextStyle(
                  color: ColorSets.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    print("Prodectivity");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      Image.asset('images/productivity.png'),
                      Text(
                        "    Productivity",
                        style: TextStyle(
                          color: ColorSets.black,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    print("Projects");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/projects.png'),
                      Text(
                        "    Projects",
                        style: TextStyle(
                            color: ColorSets.black,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
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
                            fontWeight: FontWeight.bold
                        ),
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
                          onTap: (){
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
                                    fontWeight: FontWeight.bold
                                ),
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                      onTap: (){
                        print('Print');
                      },
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
                height: 30,
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
