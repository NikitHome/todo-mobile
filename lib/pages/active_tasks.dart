import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/start.dart';


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

    todoList.addAll(['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5']);
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
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Card(
                    color: const Color.fromRGBO(82, 182, 154, 1.0),
                    child: ListTile(
                      title: Text(todoList[index], style: const TextStyle(
                          fontFamily: 'Merienda',
                          fontSize: 25,
                          color: Colors.white
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
                                  title: const Text('Change task'),
                                  content: TextField(
                                    onChanged: (String value) {
                                      setState( () => _changeTodo = value );
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => _changeTask(index),
                                        child: const Text('Change')
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
              title: const Text('Add task'),
              content: TextField(
                onChanged: (String value) {
                  setState( () => _userTodo = value );
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: _addTask,
                    child: const Text('Add')
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
