import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/screens/all_tasks.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/screens/one_task.dart';
import 'package:todolist/screens/create_task.dart';
import 'package:google_fonts/google_fonts.dart';

/*void main() {
  runApp(const MaterialApp(
    home: TodoList(),
  ));
}*/

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksCollection(),
    child: const TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(builder: (context, taskCollection, child) {
      return FutureBuilder(
          future: taskCollection.getTaskFromAPI(),
          builder: ((context, snapshot) {
            return MaterialApp(
              title: 'TodoList',
              theme: ThemeData(
                primarySwatch: Colors.orange,
                textTheme: GoogleFonts.robotoTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: AllTasks.route,
              routes: {
                OneTask.route: (context) => const OneTask(),
                AllTasks.route: (context) => AllTasks(
                      title: 'TodoList',
                    ),
                CreateTask.route: (context) => const CreateTask(),
              },
            );
          }));
    });
  }
}
