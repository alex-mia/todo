import 'package:flutter/material.dart';
import 'package:todo/add_new_todo/data_task/task_overdue_repository.dart';
import 'package:todo/add_new_todo/data_task/task_repository.dart';
import 'package:todo/add_new_todo/data_task/task_today_repository.dart';
import 'package:todo/add_new_todo/data_task/task_upcoming_repository.dart';
import 'package:todo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/autorization/email_provider.dart';
import 'package:todo/autorization/password_provider.dart';
import 'package:todo/home.dart';
import 'package:todo/projects/data_project/project_repository.dart';
import 'package:todo/projects/data_project/task_projects_filter_repository.dart';


class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void validatePassword(WidgetRef ref, password){
      ref.read(PasswordRiverpodProvider.notifier).validatePassword(password);
    };
    void validateEmail(WidgetRef ref, email){
      ref.read(EmailRiverpodProvider.notifier).validateEmail(email);
    };
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: ColorSets.yellow,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(right: 16, left: 16),
        color: ColorSets.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16,bottom: 10),
                child: Text(
                  "EMAIL",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSets.grey_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: '${ref.watch(EmailRiverpodProvider)}',
                  errorStyle: TextStyle(
                    color: '${ref.watch(EmailRiverpodProvider)}' != 'OK' ? Colors.red : Colors.green,
                  ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (email) {
                    validateEmail(ref, email);
                  },
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16,bottom: 10),
                child: Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSets.grey_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorSets.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                      errorText: '${ref.watch(PasswordRiverpodProvider)}',
                    errorStyle: TextStyle(
                      color: '${ref.watch(PasswordRiverpodProvider)}' != 'OK' ? Colors.red : Colors.green,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                    onSubmitted: (password) {
                    validatePassword(ref, password);
                  },
                  style: TextStyle(fontSize: 16, color: ColorSets.white),
                  cursorColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 220,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(60, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: '${ref.watch(PasswordRiverpodProvider)}' == 'OK' && '${ref.watch(EmailRiverpodProvider)}' == 'OK' ? (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));
                        ref.read(DataTasksRiverpodProvider.notifier).getTasks;
                        ref.watch(DataTasksOverdueRiverpodProvider.notifier).getTasksOverdue;
                        ref.watch(DataTasksTodayRiverpodProvider.notifier).getTasksToday;
                        ref.watch(DataTasksUpcomingRiverpodProvider.notifier).getTasksUpcoming;
                        ref.watch(DataProjectsRiverpodProvider.notifier).getProjects;
                        ref.watch(DataTasksFilterProjectRiverpodProvider.notifier).getTasksFilterProject;
                        } : null,
                        child: Text('SIGN IN'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}