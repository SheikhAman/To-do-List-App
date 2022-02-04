import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  UnmodifiableListView<Task> get tasks {
    // You can't add tasks  in UnmodifiableListView data type
    // we got a unmodifiableListView from dart:collection library
    return UnmodifiableListView(_tasks); // tasks getter will only return _tasks
  }

  int get taskCount {
    // we made a getter to get the length
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners(); // notifyListen diye sob update korbe
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
