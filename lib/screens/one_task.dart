import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/models/task.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key}) : super(key: key);

  static String get route => '/one_task';

  @override
  State<OneTask> createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier la tâche "${task!.content}"'),
        ),
        body: TaskForm(task: task));
  }
}
