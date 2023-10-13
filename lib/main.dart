import 'package:flutter/material.dart';
import 'package:todo/pages/home.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue
    ),
    home: const Home(),
  ));
}

