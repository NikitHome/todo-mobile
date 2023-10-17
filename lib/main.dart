import 'package:flutter/material.dart';
import 'package:todo_app/pages/active_tasks.dart';
import 'package:todo_app/pages/start.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: const Color.fromRGBO(24, 78, 119, 1.0)
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const StartScreen(),
      '/todo': (context) => const ActiveTasks()
    },
  ));
}

