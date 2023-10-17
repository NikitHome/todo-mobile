import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/main_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: const Color.fromRGBO(134, 174, 213, 1)
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const MainScreen(),
      '/todo': (context) => const Home()
    },
  ));
}

