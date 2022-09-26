import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../add_new_todo/inbox_provider.dart';
import '../tasks_repository/total_tasks_provider.dart';

class Inbox extends ConsumerWidget {
  Inbox({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  // List totalNoTimeTaskKey = totalNoTimeTask.keys.toList();

  void changeCompletedIcon(WidgetRef ref, text) {
    ref
        .watch(Task_repository_RiverpodProvider.notifier)
        .changeCompletedIcon(text);
  }
  void deletTask(WidgetRef ref, textTask) {
    ref
        .watch(Task_repository_RiverpodProvider.notifier)
        .deletTask(textTask);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Inbox'),
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
                itemCount: totalNoTimeTaskKey.length,
                itemBuilder: (BuildContext context, int index) {
                  ref.watch(Task_repository_RiverpodProvider).taskKey;
                  ref.watch(Task_repository_RiverpodProvider).iconChange;
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {deletTask(ref, totalInboxTaskKey[index]);},
                    background: Container(color: Colors.grey.shade800,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(Icons.delete_sweep, color: Colors.red.shade700, size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius:
                        BorderRadius.circular(20.0), //<-- SEE HERE
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
                              child: Icon(
                                  totalIconSearch[totalNoTimeTaskKey[index]],
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                changeCompletedIcon(ref,
                                    '${totalInboxTask[totalNoTimeTaskKey[index]]}');
                              },
                            ),
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
                                  totalUpcomingTask[
                                  totalNoTimeTaskKey[index]] !=
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
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
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
              BoxConstraints(maxWidth: double.infinity, maxHeight: 490),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: totalInboxTaskKey.length,
                itemBuilder: (BuildContext context, int index) {
                  ref.watch(Task_repository_RiverpodProvider).taskKey;
                  ref.watch(Task_repository_RiverpodProvider).iconChange;
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {deletTask(ref, totalInboxTaskKey[index]);},
                    background: Container(color: Colors.grey.shade800,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(Icons.delete_sweep, color: Colors.red.shade700, size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
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
                              child: Icon(totalIconSearch[totalInboxTaskKey[index]],
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                changeCompletedIcon(
                                    ref, '${totalInboxTask[totalInboxTaskKey[index]]}');
                              },
                            ),
                            title: Text(
                              '${totalInboxTask[totalInboxTaskKey[index]]}',
                              style: TextStyle(color: ColorSets.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 50, bottom: 15),
                                child: Image.asset(
                                    totalTodayTask[totalInboxTaskKey[index]] != null
                                        ? 'images/today.png'
                                        : totalUpcomingTask[totalInboxTaskKey[index]] != null
                                        ? 'images/upcoming.png'
                                        : 'images/time.png',
                                    width: 20,
                                    height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  totalTodayTask[totalInboxTaskKey[index]] != null
                                      ? '  Today'
                                      : totalUpcomingTask[totalInboxTaskKey[index]] != null
                                      ? '  Upcoming'
                                      : totalNoTimeTask[totalInboxTaskKey[index]] != null
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
                                child: Icon(totalIconTask[totalInboxTaskKey[index]],
                                    color: totalColorsTask[totalInboxTaskKey[index]], size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${totalProjectsTask[totalInboxTaskKey[index]]}',
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
                    ),
                  );
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