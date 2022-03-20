import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/models/task.dart';
import 'package:dio/dio.dart';

class TasksCollection extends ChangeNotifier {
  List<Task> tasksList = tasks;

  Future getTaskFromAPI() async {
    var response = await Dio().get('https://jsonplaceholder.typicode.com/todos',
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        }));
    List task = response.data;
    tasksList.addAll(task.map((i) => Task.fromJson(i)).toList());
    tasksList = task.map((i) => Task.fromJson(i)).toList();
    notifyListeners();
    return tasksList;
  }

  Future deleteTaskAPI(int id) async {
    var response = await Dio()
        .delete("https://jsonplaceholder.typicode.com/todos/${id.toString()}",
            options: Options(headers: {
              Headers.contentTypeHeader: 'application/json',
              Headers.acceptHeader: 'application/json'
            }));

    return response.statusCode == 200;
  }

  List<Task> getAllTAsks() {
    return tasksList;
  }

  int lengthListTasks() {
    return tasksList.length;
  }

  void createTask(Task task) {
    tasksList.add(task);
    notifyListeners();
  }

  void updateTask(Task newTask) {
    tasksList[tasksList.indexWhere((item) => item.id == newTask.id)] = newTask;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasksList.removeWhere((item) => item.id == task.id);
    notifyListeners();
  }
}
