import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview(
      {Key? key,
      required this.task,
      required this.onTaskPreviewTap,
      required double? alignment,
      required Decoration decoration})
      : super(key: key);

  final Task task;
  final Function onTaskPreviewTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: !task.completed
            ? const Icon(Icons.check_box_outline_blank_rounded)
            : const Icon(Icons.check_box_rounded),
        title: Text(task.content, style: const TextStyle(fontSize: 18)),
        subtitle: !task.completed
            ? Text('Créer le ${task.createdAt}',
                style: const TextStyle(color: Colors.blueGrey))
            : Text(
                'Créer le ${task.createdAt}',
                style: const TextStyle(color: Colors.lightGreen),
              ),
        trailing: const Icon(Icons.drag_handle_rounded),
        onTap: () {
          onTaskPreviewTap(task);
        },
        tileColor: !task.completed ? Colors.red[100] : Colors.white);
  }
}
