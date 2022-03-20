import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/models/task.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks_collection.dart';
//import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/tools/showSnackBar.dart';
import 'package:todolist/screens/create_task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;
  static String get route => '/all_tasks';

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? taskChosen;
  //bool isPreview = false;

  void _closeDetails() {
    setState(() {
      taskChosen = null;
    });
  }

  void _updateDetails() {
    print('test');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: ((context, taskCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                (taskChosen != null)
                    ? TaskDetails(
                        task: taskChosen,
                        onClose: _closeDetails,
                        Update: () {
                          taskChosen = null;
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Cette tâche à bien été modifié'),
                            ),
                          );
                        },
                        onRemove: () {
                          setState(() {
                            taskCollection.deleteTask(taskChosen!);
                            taskChosen = null;
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBarMessage()
                                    .success('Cette tâche à bien été supprimé')
                                /*SnackBar(
                                content:
                                    Text('Cette tâche à bien été supprimé'),
                              ),*/
                                );
                            /*
                            String msg = "";

                            taskCollection
                                .deleteTaskAPI(taskChosen!.id)
                                .then((value) {
                              if (value == true) {
                                //Success delete from api
                                msg = "Tâche supprimé !";
                              } else {
                                //Api response !=200
                                msg =
                                    "Opps! Une erreur est survenue, réessayer à nouveau";
                              }
                              //hide current snackbar
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              //display snackBar of success
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarMessage().success(msg));
                            });
                            //hide taskDetails
                            taskChosen = null;*/
                          });
                        })
                    : const Text('')
              ],
            ),
            Expanded(
                child: TaskMaster(
              dataTasks: taskCollection.getAllTAsks(), //data.tasks,
              onTaskPreviewUp: (Task task) {
                debugPrint('All task are ok !');
                setState(() {
                  taskChosen = task;
                  //isPreview = true;
                });
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateTask.route);
          },
          tooltip: 'Ajout Task',
          child: const Icon(Icons.add),
        ),
      );
    }));
  }
}
