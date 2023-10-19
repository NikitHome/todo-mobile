import 'package:flutter/material.dart';
import 'package:todo_app/pages/start_page/buttons/ActiveTasksButton.dart';
import 'package:todo_app/pages/start_page/buttons/CompleteTasksButton.dart';
import 'package:todo_app/pages/start_page/buttons/SettingsButton.dart';
import 'package:todo_app/pages/start_page/buttons/SupportProjectButton.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: const Text('Tasks', style: TextStyle(
            fontSize: 30,
            fontFamily: 'Merienda'
          ),),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(24, 78, 119, 1.0),
          elevation: 0.2,
        ),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActiveTasksButton(),
              Padding(
                  padding: EdgeInsets.only(top: 25)
              ),
              CompleteTasksButton(),
              Padding(
                  padding: EdgeInsets.only(top: 25)
              ),
              SettingsButton(),
              Padding(
                  padding: EdgeInsets.only(top: 25)
              ),
              SupportProjectButton()
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(26, 117, 159, 1.0)
    );
  }
}