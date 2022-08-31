import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Inbox_RiverpodProvider = StateNotifierProvider((ref) => Inbox_Provider());

class Inbox_Provider extends StateNotifier<String> {
  Inbox_Provider() : super('  Inbox');

  void show_inbox(BuildContext context) {
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: ColorSets.gray,
      context: context,
      builder: (ctx) =>
          Container(
            width: 300,
            height: 400,
            color: ColorSets.gray,
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: ColorSets.grey_text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Text(
                        '  Projects',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorSets.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: ColorSets.white),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/inbox.png',
                        width: 20, height: 20),
                  ),
                  Text('Inbox', style: TextStyle(
                    color: ColorSets.white,
                  ),),
                ],),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Divider(color: ColorSets.white),
                ),
                ListTile(
                  onTap: () {
                    state = '  Personal';
                  },
                  leading: Image.asset('images/rectangle_yellow.png'),
                  title: Text(
                    'Personal',
                    style: TextStyle(color: ColorSets.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Divider(color: ColorSets.white),
                ),
                ListTile(
                  onTap: () {
                    state = '  Work';
                  },
                  leading: Image.asset('images/rectangle_orange.png'),
                  title: Text(
                    'Work',
                    style: TextStyle(color: ColorSets.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Divider(color: ColorSets.white),
                ),
                ListTile(
                  onTap: () {
                    state = '  Design';
                  },
                  leading: Image.asset('images/rectangle_purple.png'),
                  title: Text(
                    'Design',
                    style: TextStyle(color: ColorSets.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Divider(color: ColorSets.white),
                ),
                ListTile(
                  onTap: () {
                    state = '  Study';
                  },
                  leading: Image.asset('images/rectangle_green.png'),
                  title: Text(
                    'Study',
                    style: TextStyle(color: ColorSets.white),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
