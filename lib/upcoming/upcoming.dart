import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../add_new_todo/inbox_provider.dart';
import '../tasks_repository/total_tasks_provider.dart';

class Upcoming extends ConsumerWidget {
  Upcoming({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  void deletTask(WidgetRef ref, textTask) {
    ref
        .watch(Task_repository_RiverpodProvider.notifier)
        .deletTask(textTask);
  }

  void changeCompletedIcon(WidgetRef ref, text) {
    ref
        .watch(Task_repository_RiverpodProvider.notifier)
        .changeCompletedIcon(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Upcoming'),
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
                    onDismissed: (direction) {deletTask(ref, totalNoTimeTaskKey[index]);},
                    background: Container(
                      color: Colors.grey.shade800,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(
                              Icons.delete_sweep,
                              color: Colors.red.shade700,
                              size: 35,
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
                'UPCOMING',
                style: TextStyle(
                  color: ColorSets.grey_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints:
                  BoxConstraints(maxWidth: double.infinity, maxHeight: 300),
              color: ColorSets.black,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: totalUpcomingTaskKey.length,
                itemBuilder: (BuildContext context, int index) {
                  ref.watch(Task_repository_RiverpodProvider).taskKey;
                  ref.watch(Task_repository_RiverpodProvider).iconChange;
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {deletTask(ref, totalUpcomingTaskKey[index]);},
                    background: Container(
                      color: Colors.grey.shade800,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Icon(
                              Icons.delete_sweep,
                              color: Colors.red.shade700,
                              size: 35,
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
                                  totalIconSearch[totalUpcomingTaskKey[index]],
                                  color: Colors.grey),
                              highlightColor: Colors.deepOrange,
                              radius: 40.0,
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                changeCompletedIcon(ref,
                                    '${totalUpcomingTask[totalUpcomingTaskKey[index]]}');
                              },
                            ),
                            title: Text(
                              '${totalUpcomingTask[totalUpcomingTaskKey[index]]}',
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
                                                totalUpcomingTaskKey[index]] !=
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
                                              totalUpcomingTaskKey[index]] !=
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
                                    totalIconTask[totalUpcomingTaskKey[index]],
                                    color: totalColorsTask[
                                        totalUpcomingTaskKey[index]],
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '  ${totalProjectsTask[totalUpcomingTaskKey[index]]}',
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
          print('$totalUpcomingTaskKey');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
