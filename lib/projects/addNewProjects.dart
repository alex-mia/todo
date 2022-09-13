import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../colors.dart';
import 'add_projects_provider.dart';


class AddNewProjects extends ConsumerWidget {
  AddNewProjects({Key? key}) : super(key: key);

  void textProjects(WidgetRef ref, text) {
    ref.watch(AddProjects_RiverpodProvider.notifier).textProjects(text);
  }

  void addProjects(WidgetRef ref, text, color) {
    ref.watch(AddProjects_RiverpodProvider.notifier).addProjects(text, color);
  }

  void dataPocessingColorIcon(WidgetRef ref, color, icon) {
    ref.watch(AddProjects_RiverpodProvider.notifier).dataPocessingColorIcon(color, icon);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      Navigator.pushNamed(context, '/home');
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
                  onPressed: (){dataPocessingColorIcon(ref, Colors.yellow, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.yellow ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                    color: Colors.yellow,
                    size: 30,
                  ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.green, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.green ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.green,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.red, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.red ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.red,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.orange, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.orange ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.orange,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.purpleAccent, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.purpleAccent ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.purpleAccent,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.lightBlueAccent, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.lightBlueAccent ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.deepPurpleAccent, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.deepPurpleAccent ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.deepPurpleAccent,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.blueAccent, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.blueAccent ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.blueAccent,
                      size: 30,
                    ),),
                  IconButton(
                    onPressed: (){dataPocessingColorIcon(ref, Colors.pinkAccent, ref.watch(AddProjects_RiverpodProvider).icon,);},
                    icon: Icon(
                      ref.watch(AddProjects_RiverpodProvider).color == Colors.pinkAccent ? ref.watch(AddProjects_RiverpodProvider).icon : Icons.circle_rounded,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),),
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
                onPressed: ref.watch(AddProjects_RiverpodProvider).hasText == true && ref.watch(AddProjects_RiverpodProvider).icon != Icons.circle_rounded
    ? () { addProjects(
                  ref,
                    ref.watch(AddProjects_RiverpodProvider).text,
                  ref.watch(AddProjects_RiverpodProvider).color,
                );
                }
        : null,
                child: Text('ADD PROJECT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
