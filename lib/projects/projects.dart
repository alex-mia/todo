import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/data_project/project_repository.dart';


class Projects extends ConsumerWidget {
  Projects({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(DataProjectsRiverpodProvider.notifier).getProjects;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Projects'),
        backgroundColor: ColorSets.yellow,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_projects');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body:
      Container(
        constraints:
        BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
        color: ColorSets.black,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: ref.watch(DataProjectsRiverpodProvider).length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
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
                    leading: Icon(Icons.circle_rounded,
                      size: 14,
                      color: Color(int.parse("${ref.watch(DataProjectsRiverpodProvider)[index].color!.replaceAll('Color(', '').replaceAll(')', '')}"),),),
                    title: Text(
                      '${ref.watch(DataProjectsRiverpodProvider)[index].text}',
                      style: TextStyle(color: ColorSets.white),
                    ),
                      ),
                    ],
                  ),
              );
          },
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
