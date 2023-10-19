import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActiveTasksButton extends StatelessWidget {
  const ActiveTasksButton({super.key});

  void activeTaskButton(context) {
    Navigator.pushNamed(context, '/active_tasks');

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
                  minimumSize: const Size(310, 70),
                  backgroundColor: const Color.fromRGBO(82, 182, 154, 1.0),
                  elevation: 10
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