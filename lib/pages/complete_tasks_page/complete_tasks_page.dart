import 'package:flutter/material.dart';

class CompleteTasks extends StatefulWidget {
  const CompleteTasks({super.key});

  @override
  State<CompleteTasks> createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  List todoList = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5', 'Task 6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Complete tasks',
              style: TextStyle(fontSize: 30, fontFamily: 'Merienda'),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(24, 78, 119, 1.0),
            elevation: 0.2),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Card(
                    elevation: 7,
                    shadowColor: const Color.fromRGBO(1, 70, 52, 1.0),
                    color: const Color.fromRGBO(82, 182, 154, 1.0),
                    child: ListTile(
                      title: Text(todoList[index],
                          style: const TextStyle(
                              fontFamily: 'Merienda',
                              fontSize: 25,
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 3.0),
                                  blurRadius: 10.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ]),
                          textAlign: TextAlign.center),
                    ),
                  ),
                );
              }),
        ),
        backgroundColor: const Color.fromRGBO(26, 117, 159, 1.0));
  }
}
