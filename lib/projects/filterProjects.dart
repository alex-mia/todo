import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../add_new_todo/inbox_provider.dart';
import '../tasks_repository/total_tasks_provider.dart';
import 'add_projects_provider.dart';

class FilterProjects extends ConsumerWidget {
  FilterProjects({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  // List totalTodayTaskKey = totalTodayTask.keys.toList();
  // List totalNoTimeTaskKey = totalNoTimeTask.keys.toList();

  void changeCompletedIcon(WidgetRef ref, text) {
    ref.watch(Task_repository_RiverpodProvider.notifier).changeCompletedIcon(text);
  }

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
              BoxConstraints(maxWidth: double.infinity, maxHeight: 580),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: totalProjectsTaskKey.length,
                itemBuilder: (BuildContext context, int index) {
                  ref.watch(Task_repository_RiverpodProvider).taskKey;
                  ref.watch(Task_repository_RiverpodProvider).iconChange;
                  if ('${ref.watch(AddProjects_RiverpodProvider).text}' == totalProjectsTask[totalProjectsTaskKey[index]]) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      elevation: 5,
                      color: ColorSets.black,
                      shadowColor: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: InkWell(
                              child: Icon(totalIconSearch[totalProjectsTaskKey[index]],
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                changeCompletedIcon(ref, '${totalInboxTask[totalProjectsTaskKey[index]]}');
                              },
                            ),
                            title: Text(
                              '${totalInboxTask[totalProjectsTaskKey[index]]}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 50, bottom: 15),
                                child: Image.asset(
                                    totalTodayTask[totalProjectsTaskKey[index]] != null
                                        ? 'images/today.png'
                                        : totalUpcomingTask[totalProjectsTaskKey[index]] != null
                                        ? 'images/upcoming.png'
                                        : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  totalTodayTask[totalProjectsTaskKey[index]] != null
                                      ? '  Today'
                                      : totalUpcomingTask[totalProjectsTaskKey[index]] != null
                                      ? '  Upcoming'
                                      : totalNoTimeTask[totalProjectsTaskKey[index]] != null
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
                                child: Icon(totalIconTask[totalProjectsTaskKey[index]],
                                    color: totalColorsTask[totalProjectsTaskKey[index]], size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${totalProjectsTask[totalProjectsTaskKey[index]]}',
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