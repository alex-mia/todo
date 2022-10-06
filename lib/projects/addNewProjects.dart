import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/projects/data_project/project_repository.dart';
import '../colors.dart';
import 'add_projects_provider.dart';



class AddNewProjects extends ConsumerWidget {
  AddNewProjects({Key? key}) : super(key: key);

  void textProjects(WidgetRef ref, text) {
    ref.watch(AddProjectsRiverpodProvider.notifier).textProjects(text);
  }

  void colorProjects(WidgetRef ref, color, icon) {
    ref.watch(AddProjectsRiverpodProvider.notifier).colorProjects(color, icon);
  }

  void addProjects(WidgetRef ref, text, color, icon) {
    ref.watch(AddProjectsRiverpodProvider.notifier).addProjects(text, color, icon);
  }

  void getProjects(WidgetRef ref) {
    ref.watch(DataProjectsRiverpodProvider.notifier).getProjects;
  } //read

  void addProject(WidgetRef ref, project) {
    ref.read(DataProjectsRiverpodProvider.notifier).addProject(project);
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refState = ref.watch(AddProjectsRiverpodProvider);
    return Scaffold(
      backgroundColor: ColorSets.black,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: IconButton(
                    icon: Image.asset('images/close.png'),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.pushNamed(context, '/projects');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 30),
                  child: Text(
                    'Add new projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    'NAME',
                    style: TextStyle(
                      color: ColorSets.grey_text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    textProjects(ref, text);
                  },
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25, bottom: 15),
                  child: Text(
                    'COLOR',
                    style: TextStyle(
                      color: ColorSets.grey_text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                            colorProjects(ref, Color(0xFFf7ff03), IconData(0xe163), );
                          },
                    icon: Icon(
                      refState.color ==
                          Color(0xFFf7ff03)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFFf7ff03),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFF2dff03), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
    Color(0xFF2dff03)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFF2dff03),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFFff1303), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFFff1303)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFFff1303),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFFff6303), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFFff6303)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFFff6303),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFF196b00), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFF196b00)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFF196b00),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFF03f7ff),IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFF03f7ff)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFF03f7ff),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFF7403ff), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFF7403ff)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFF7403ff),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFF2803ff), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFF2803ff)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFF2803ff),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                  IconButton(
                    onPressed: (){
                      colorProjects(ref, Color(0xFFea03ff), IconData(0xe163),);
                    },
                    icon: Icon(
                      ref.watch(AddProjectsRiverpodProvider).color ==
                          Color(0xFFea03ff)
                          ? IconData(0xe856, fontFamily: 'MaterialIcons')
                          : IconData(0xe163, fontFamily: 'MaterialIcons'),
                      color: Color(0xFFea03ff),
                      size: 30,
                    ),
                    splashRadius: 0.1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: ref.read(AddProjectsRiverpodProvider).text != '' && ref.watch(AddProjectsRiverpodProvider).color != null ? (){
                        addProjects(
                          ref,
                          ref.watch(AddProjectsRiverpodProvider).text,
                          ref.watch(AddProjectsRiverpodProvider).color,
                          ref.watch(AddProjectsRiverpodProvider).icon,
                        );
                        addProject(ref, ref.watch(AddProjectsRiverpodProvider).projectDto);
                        ref.watch(DataProjectsRiverpodProvider.notifier).getProjects;
                        Navigator.pushNamed(context, '/projects');
                        } : null,
                child: Text('ADD PROJECT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
