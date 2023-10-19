import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/start_page/buttons/CompleteTasksButton.dart';
import 'package:todo_app/pages/start_page/buttons/SettingsButton.dart';

class ActiveTasks extends StatefulWidget {
  const ActiveTasks({super.key});

  @override
  State<ActiveTasks> createState() => _ActiveTasksState();
}

class _ActiveTasksState extends State<ActiveTasks> {

  late String _userTodo;
  late String _changeTodo;
  List todoList = [];

  CompleteTasksButton completeTasksButton = const CompleteTasksButton();
  SettingsButton settingsButton = const SettingsButton();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll([
      'Task 7', 'Task 8', 'Task 9', 'Task 10', 'Task 11', 'Task 12', 'Task 13'
    ]);
  }

  void _changeTask(index) {
    setState(() {
      todoList[index] = _changeTodo;
    });

    Navigator.of(context).pop();

    if (kDebugMode) {
      print('Change task');
    }
  }

  void _deleteTask(index) {
    setState(() {
      todoList.removeAt(index);
    });

    if (kDebugMode) {
      print('Delete task');
    }
  }

  void _addTask() {
    setState(() {
      todoList.add(_userTodo);
    });

    Navigator.of(context).pop();

    if (kDebugMode) {
      print('Add task');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active tasks', style: TextStyle(
            fontSize: 30,
            fontFamily: 'Merienda'
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(24, 78, 119, 1.0),
        elevation: 0.2
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(todoList[index]),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) => _deleteTask(index),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Card(
                    elevation: 7,
                    shadowColor: const Color.fromRGBO(1, 70, 52, 1.0),
                    color: const Color.fromRGBO(82, 182, 154, 1.0),
                    child: ListTile(
                      title: Text(todoList[index], style: const TextStyle(
                          fontFamily: 'Merienda',
                          fontSize: 25,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 3.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ]
                      ),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromRGBO(19, 111, 99, 1.0),
                            ),
                            padding: const EdgeInsets.only(right: 8.0),
                            constraints: const BoxConstraints(),
                            onPressed: () => {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Edit task', style: TextStyle(
                                      fontFamily: 'Merienda'
                                  ),),
                                  content: TextField(
                                    onChanged: (String value) {
                                      setState( () => _changeTodo = value );
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0)
                                        ),
                                        onPressed: () => _changeTask(index),
                                        child: const Text('Change', style: TextStyle(
                                            fontFamily: 'Merienda'
                                        ),)
                                    )
                                  ],
                                );
                              })
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => _deleteTask(index),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
      backgroundColor: const Color.fromRGBO(26, 117, 159, 1.0),

      floatingActionButton: FloatingActionButton(
        elevation: 0.5,
        backgroundColor: const Color.fromRGBO(153, 217, 140, 1.0),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add task', style: TextStyle(
                fontFamily: 'Merienda'
              ),),
              content: TextField(
                onChanged: (String value) {
                  setState( () => _userTodo = value );
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: _addTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0)
                    ),
                    child: const Text('Add', style: TextStyle(
                      fontFamily: 'Merienda'
                    ),)
                )
              ],
            );
          });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
