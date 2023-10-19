import 'package:flutter/material.dart';
import 'package:todo_app/pages/active_tasks_page/active_tasks_page.dart';
import 'package:todo_app/pages/complete_tasks_page/complete_tasks_page.dart';
import 'package:todo_app/pages/start_page/start_page.dart';


void main() async {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: const Color.fromRGBO(24, 78, 119, 1.0)
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const StartScreen(),
      '/active_tasks': (context) => const ActiveTasks(),
      '/complete_tasks': (context) => const CompleteTasks()
    },
  ));
}

