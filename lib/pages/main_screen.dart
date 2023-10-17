import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void activeTaskButton(context) {
    if (kDebugMode) {
      print('Active tasks');
    }

    Navigator.pushReplacementNamed(context, '/todo');
  }

  void completeTaskButton() {
    if (kDebugMode) {
      print('Complete tasks');
    }
  }

  void settingsButton() {
    if (kDebugMode) {
      print('Settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(24, 68, 125, 0.6),
        elevation: 0.5,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => activeTaskButton(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(280, 70)
                  ),
                  child: const Text('Active tasks', style: TextStyle(
                    fontSize: 35
                  ),)
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 25)
              ),
              ElevatedButton(
                  onPressed: completeTaskButton,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 70)
                  ),
                  child: const Text('Complete tasks', style: TextStyle(
                      fontSize: 35
                  ),)
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 25)
              ),
              ElevatedButton(
                  onPressed: settingsButton,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 70)
                  ),
                  child: const Text('Settings', style: TextStyle(
                      fontSize: 35
                  ),)
              )
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(134, 174, 213, 1.0)
    );
  }
}
