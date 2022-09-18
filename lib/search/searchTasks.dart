import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/search/search_provider.dart';
import '../add_new_todo/inbox_provider.dart';
import '../colors.dart';
import '../projects/add_projects_provider.dart';
import '../tasks_repository/total_tasks_provider.dart';

class SearchTask extends ConsumerWidget {
  SearchTask({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  void validDateSearch(WidgetRef ref, text) {
    ref.read(Search_Provider_RiverpodProvider.notifier).validDateSearch(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorSets.black,
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 60),
              child: Container(
                width: 250,
                height: 45,
                child: TextField(
                  cursorColor: ColorSets.white,
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    validDateSearch(ref, text);
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:
                        TextStyle(color: ColorSets.white, fontSize: 20),
                    hintText: "🔍 ",
                    fillColor: ColorSets.gray,
                    filled: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: GestureDetector(

                onTap: (){Navigator.pop(context, '/home');
                  },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 350,
              constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: 400),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: ref.watch(Search_Provider_RiverpodProvider) == 0 ? 0 : totalSearchTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: ColorSets.black,
                    shadowColor: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading:
                          Icon(Icons.radio_button_off, color: Colors.grey),
                          title: Text(
                            '${totalInboxTask[totalSearchTask[index]]}',
                            style: TextStyle(color: ColorSets.white),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 50, bottom: 15),
                              child: Image.asset(
                                  totalTodayTask[totalSearchTask[index]] != null
                                      ? 'images/today.png'
                                      : totalUpcomingTask[totalSearchTask[index]] != null
                                      ? 'images/upcoming.png'
                                      : 'images/time.png',
                                  width: 20,
                                  height: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                totalTodayTask[totalSearchTask[index]] != null
                                    ? '  Today'
                                    : totalUpcomingTask[totalSearchTask[index]] != null
                                    ? '  Upcoming'
                                    : totalNoTimeTask[totalSearchTask[index]] != null
                                    ? '  no time'
                                    : 'no time',
                                style: TextStyle(
                                  color: ColorSets.grey_text,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, bottom: 15),
                              child: Icon(totalIconTask[totalSearchTask[index]],
                                  color: totalColorsTask[totalSearchTask[index]], size: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                '  ${totalProjectsTask[index + 1]}',
                                style: TextStyle(
                                    color:
                                    '${ref.watch(Inbox_RiverpodProvider).text}' !=
                                        null
                                        ? ColorSets.white
                                        : ColorSets.grey_text),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
