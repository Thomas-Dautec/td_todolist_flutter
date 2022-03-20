import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';

//méthode generate
List<Task> tasks = [
  Task(1, "Flutter", false, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(2, "Dart", false, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(3, "Code", false, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(4, "CIASIE", true, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(5, "Others", false, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
];
//Prise à la main
/*List<Task> tasks = [
  Task(1, 'Police', true, DateTime.now()),
  Task(2, 'Pompier', true, DateTime.now()),
  Task(3, 'Ambulance', false, DateTime.now()),
  Task(4, 'Travail', false, DateTime.now()),
  Task(5, 'Autres', true, DateTime.now()),
  Task(6, 'Aides', false, DateTime.now()),
];
*/
//méthode generate


