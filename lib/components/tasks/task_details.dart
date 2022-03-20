import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:todolist/models/task.dart';
import 'package:todolist/screens/one_task.dart';

import 'package:todolist/tools/showSnackBar.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key,
      required this.task,
      required this.onClose,
      required this.onRemove,
      required this.Update})
      : super(key: key);

  final Task? task;
  final Function onClose;
  final Function onRemove;
  final Function Update;

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code, dead_code
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: task!.completed ? Colors.orange[300] : Colors.green[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                    onPressed: () {
                      //callback in allTasks (after that, there is a setState ...)
                      onClose();
                    },
                  ),
                ],
              ),
              Text(
                'Les détails ${task!.content}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              // Text(task!.description),
              const SizedBox(
                height: 3,
              ),
              /*
            const Divider(
              thickness: 2,
            ),*/
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('${task!.createdAt}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        padding: const EdgeInsets.all(5),
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          //hide current snackbar
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          // snackBar of question about suppression or not & action
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBarMessage().validation(
                                  'Êtes-vous sûr de supprimer cette tâche ?',
                                  'Oui',
                                  onRemove));
                        }),
                    IconButton(
                        padding: const EdgeInsets.all(5),
                        color: Colors.blue,
                        splashColor: Colors.green,
                        hoverColor: Colors.red,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.change_circle),
                        onPressed: () {
                          /*Navigator.pushNamed(context, OneTask.route,
                            arguments: task);*/
                          Update();
                        }),
                  ],
                ),
              ]),
            ]),
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //to change the dte US into FR
    var newDate =
        DateFormat.yMMMMd('fr_FR').format(task!.createdAt!); //date formating

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close),
                color: Colors.red,
                onPressed: () {
                  //callback in allTasks (after that, there is a setState ...)
                  onClose();
                },
              ),
            ],
          ),
          Text(
            task!.content,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // Text(task!.description),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Créée le $newDate'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(5),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        //hide current snackbar
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // snackBar of question about suppression or not & action
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBarMessage().validation(
                                'Êtes-vous sûr de supprimer cette tâche ?',
                                'Oui',
                                onRemove));
                      }),
                  IconButton(
                      padding: const EdgeInsets.all(5),
                      color: Colors.blue,
                      splashColor: Colors.green,
                      hoverColor: Colors.red,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.update),
                      onPressed: () {
                        Navigator.pushNamed(context, OneTask.route,
                            arguments: task);
                        onClose();
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }*/
/*
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: task!.completed ? Colors.brown[300] : Colors.green[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text('Les détails ${task!.content}'),
                const SizedBox(height: 5),
                Text('${task!.createdAt}'),
                const SizedBox(height: 10),
                task!.completed
                    ? const Text('Now')
                    : const Text('Already done dude, relax'),
                const SizedBox(height: 10),
              ],
            ),
            Column(children: const [
              Icon(Icons.change_circle),
            ]),
            Column(children: const [Icon(Icons.delete)]),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(
                  onPressed: () {
                    onClose();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }*/
/*
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width: task.completed ? 400 : 400,
        height: task.completed ? 120.0 : 120.0,
        color: task.completed ? Colors.green[200] : Colors.red[200],
        alignment:
            task.completed ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Les détails sur ${task.content}'),
            const SizedBox(height: 20),
            const SizedBox(height: 3),
            Text('${task.createdAt}'),
            const SizedBox(height: 10),
            !task.completed
                ? const Text('Now')
                : const Text('Already done dude, relax'),
            const SizedBox(height: 10),
          ],
        ),
        /*Column(
          children: [
            CloseButton(
              onPressed: () {
                onClose();
              },
            )
          ]
        ,)*/
      ),
    );
  }*/
}
/*

children: <Widget>[
                Text('Les détails ${task!.content}'),
                const SizedBox(height: 5),
                Text('${task!.createdAt}'),
                const SizedBox(height: 10),
                task!.completed
                    ? const Text('Now')
                    : const Text('Already done dude, relax'),
                const SizedBox(height: 10),
              ],
            ),
            Column(children: const [
              Icon(Icons.change_circle),
            ]),
            Column(children: const [Icon(Icons.delete)]),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(
                  onPressed: () {
                    onClose();
                  },
                )
              ],
            ),*/
