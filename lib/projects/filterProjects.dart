import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../add_new_todo/inbox_provider.dart';
import '../tasks_repository/total_tasks_provider.dart';
import 'add_projects_provider.dart';

class FilterProjects extends ConsumerWidget {
  FilterProjects({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  List totalTodayTaskKey = totalTodayTask.keys.toList();
  List totalNoTimeTaskKey = totalNoTimeTask.keys.toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('${ref.watch(AddProjects_RiverpodProvider).text}'),
        backgroundColor: ColorSets.yellow,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            }),
      ),
      body: Container(
        color: ColorSets.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 36),
              child: Text(
                'OVERDUE',
                style: TextStyle(
                  color: ColorSets.grey_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints:
              BoxConstraints(maxWidth: double.infinity, maxHeight: 100),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: totalNoTimeTask.length,
                itemBuilder: (BuildContext context, int index) {
                  if ('${ref.watch(AddProjects_RiverpodProvider).text}' == totalProjectsTask[index+1]) {
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
                              '${totalInboxTask[totalNoTimeTaskKey[index]]}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 50, bottom: 15),
                                child: Image.asset(
                                    totalUpcomingTask[
                                    totalNoTimeTaskKey[index]] !=
                                        null
                                        ? 'images/upcoming.png'
                                        : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  totalUpcomingTask[totalNoTimeTaskKey[index]] !=
                                      null
                                      ? '  Upcoming'
                                      : '  no time',
                                  style: TextStyle(
                                    color: ColorSets.grey_text,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, bottom: 15),
                                child: Icon(
                                    totalIconTask[totalNoTimeTaskKey[index]],
                                    color: totalColorsTask[
                                    totalNoTimeTaskKey[index]],
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${totalProjectsTask[totalNoTimeTaskKey[index]]}',
                                  style: TextStyle(
                                      color:
                                      '${ref
                                          .watch(Inbox_RiverpodProvider)
                                          .text}' !=
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
                  } else{
                    return Card(
                      color: ColorSets.black,
                      shadowColor: Colors.white,
                      child: null,
                    );
                  }
                },
              ),
            ),
            Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'TODOS',
                style: TextStyle(
                  color: ColorSets.grey_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints:
              BoxConstraints(maxWidth: double.infinity, maxHeight: 200),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: totalInboxTask.length,
                itemBuilder: (BuildContext context, int index) {
                  if ('${ref.watch(AddProjects_RiverpodProvider).text}' == totalProjectsTask[index+1]) {
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
                              '${totalInboxTask[index]}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 50, bottom: 15),
                                child: Image.asset(
                                    totalTodayTask[index + 1] != null
                                        ? 'images/today.png'
                                        : totalUpcomingTask[index + 1] != null
                                        ? 'images/upcoming.png'
                                        : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  totalTodayTask[index + 1] != null
                                      ? '  Today'
                                      : totalUpcomingTask[index + 1] != null
                                      ? '  Upcoming'
                                      : totalNoTimeTask[index + 1] != null
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
                                child: Icon(totalIconTask[index + 1],
                                    color: totalColorsTask[index + 1], size: 20),
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
                  } else{
                    return Card(
                      color: ColorSets.black,
                      shadowColor: Colors.white,
                      child: null,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
