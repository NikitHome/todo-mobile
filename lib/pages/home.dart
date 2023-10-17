import 'package:flutter/material.dart';
import 'package:todo_app/pages/main_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userTodo;
  List todoList = [];

  MainScreen mainScreen = const MainScreen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Task 1', 'Task 2', 'Task 3', 'Task 4']);
  }

  void _deleteTask(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Menu'),
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
                      onPressed: mainScreen.completeTaskButton,
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
                      onPressed: mainScreen.settingsButton,
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
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active tasks'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(24, 68, 125, 0.6),
        elevation: 0.5,
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: const Icon(
                Icons.menu
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todoList[index]),
              onDismissed: (direction) => _deleteTask(index),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                    ),
                    onPressed: () => _deleteTask(index),
                  ),
                ),
              ),
          );
        }
      ),
      backgroundColor: const Color.fromRGBO(134, 174, 213, 1.0),
      floatingActionButton: FloatingActionButton(
        elevation: 0.5,
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add task'),
              content: TextField(
                onChanged: (String value) {
                  setState(() {
                    _userTodo = value;
                  });
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                        setState(() {
                          todoList.add(_userTodo);
                        });

                        Navigator.of(context).pop();
                    },
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
