import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../projects/add_projects_provider.dart';
import '../projects/state_projects.dart';

final Inbox_RiverpodProvider = StateNotifierProvider<Inbox_Provider, StateProjects>((ref) => Inbox_Provider());

class Inbox_Provider extends StateNotifier<StateProjects> {
  Inbox_Provider() : super(StateProjects(false, '  Inbox', Colors.yellow, Icons.inbox));

  void show_inbox(BuildContext context) {
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: ColorSets.gray,
      context: context,
      builder: (ctx) => Container(
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/inbox.png', width: 20, height: 20),
                ),
                Text(
                  'Inbox',
                  style: TextStyle(
                    color: ColorSets.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Divider(color: ColorSets.white),
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
              height: 275,
              width: 375,
              child: ListView.builder(
                itemCount: allProjects.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(1),
                    color: ColorSets.gray,
                    shadowColor: Colors.white,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                            state = StateProjects(state.hasText, allProjects[index + 1], colorProjects[index + 1], Icons.circle_sharp);
                          },
                          leading: Icon(Icons.circle_sharp,
                              size: 14, color: colorProjects[index + 1]),
                          title: Text(
                            '${allProjects[index + 1]}',
                            style: TextStyle(color: ColorSets.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
