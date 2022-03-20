import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.dataTasks, required this.onTaskPreviewUp})
      : super(key: key);
  final List<Task> dataTasks;
  final Function onTaskPreviewUp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: dataTasks.length,
        itemBuilder: (context, index) {
          return TaskPreview(
            alignment: 100.0,
            task: dataTasks[index],
            onTaskPreviewTap: (Task task) {
              //ignore_for_file: avoid_print
              print(task.content);
              onTaskPreviewUp(task);
              /*task: dataTasks[index],
              onTaskPreviewTap: (Task task) {
                //ignore_for_file: avoid_print
                print(task.content);
                onTaskPreviewUp(task);*/
            },
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        }, /*
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemCount: dataTasks.length,
        itemBuilder: (context, index) {
          return TaskPreview(
            // ignore: prefer_const_constructors
            alignment: 100.0,
            task: dataTasks[index],
            onTaskPreviewTap: (Task task) {
              //ignore_for_file: avoid_print
              print(task.content);
              onTaskPreviewUp(task);
            },
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        },*/
      ),
    );
  }
}
