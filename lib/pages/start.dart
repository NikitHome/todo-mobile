import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


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


class ActiveTasksButton extends StatelessWidget {
  const ActiveTasksButton({super.key});

  void activeTaskButton(context) {
    Navigator.pushNamed(context, '/todo');

    if (kDebugMode) {
      print('Active tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(217, 237, 146, 1.0),
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      dashPattern: const [9],
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
              onPressed: () => activeTaskButton(context),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 70),
                  backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0),
                  elevation: 0
              ),
              child: const Text('Active tasks', style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Merienda'
              ),)
          )
      ),
    );
  }
}


class CompleteTasksButton extends StatelessWidget {
  const CompleteTasksButton({super.key});

  void completeTaskButton() {
    if (kDebugMode) {
      print('Complete tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(217, 237, 146, 1.0),
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      dashPattern: const [9],
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
              onPressed: completeTaskButton,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 70),
                  backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0),
                  elevation: 0
              ),
              child: const Text('Complete tasks', style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Merienda'
              ),)
          )
      ),
    );
  }
}


class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  void settingsButton() {
    if (kDebugMode) {
      print('Settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(217, 237, 146, 1.0),
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      dashPattern: const [9],
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
              onPressed: settingsButton,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 70),
                  backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0),
                  elevation: 0
              ),
              child: const Text('Settings', style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Merienda'
              ),)
          )
      ),
    );
  }
}


class SupportProjectButton extends StatelessWidget {
  const SupportProjectButton({super.key});

  void supportProjectButton() {
    if (kDebugMode) {
      print('Support project');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(217, 237, 146, 1.0),
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      dashPattern: const [9],
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
              onPressed: supportProjectButton,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 70),
                  backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0),
                  elevation: 0
              ),
              child: const Text('Support project', style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Merienda'
              ),)
          )
      ),
    );
  }
}
