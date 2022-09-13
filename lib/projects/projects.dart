import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/add_projects_provider.dart';


class Projects extends ConsumerWidget {
  Projects({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/add_projects');
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorSets.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: ListView.separated(
            controller: _scrollController,
            itemCount: allProjects.length,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 3, color: Colors.white,),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.zero,
                color: ColorSets.gray,
                shadowColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.circle_sharp,
                          size: 14,
                          color: colorProjects[index+1]),
                      title: Text(
                        '${allProjects[index+1]}',
                        style: TextStyle(color: ColorSets.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, '/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
