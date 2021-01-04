import 'package:flutter/material.dart';

import '../../domain/models/task_model.dart';
import '../../domain/repositories/task_respository.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepositoryInterface taskRepositoryInterface;
  TaskProvider(this.taskRepositoryInterface);

  List<TaskModel> _tasksList = <TaskModel>[];

  List<TaskModel> get tasksList => _tasksList;

  Future _loadTasks() async {
    final result = await taskRepositoryInterface.getAllTasks();
    _tasksList = result;
    notifyListeners();
    print(_tasksList);
  }

  void getAllTasks() async {
    await _loadTasks();
  }

  void createTask(TaskModel task) async {
    await taskRepositoryInterface.createTask(task);
    _tasksList.add(task);
    notifyListeners();
  }

  Future<TaskModel> getById(String id) async =>
      taskRepositoryInterface.getTaskById(id);

  void deleteById(String id) async {
    await taskRepositoryInterface.deleteTaskById(id);
    _loadTasks();
  }

  void deleteAllTasks() async {
    await taskRepositoryInterface.delteAllTasks();
    _loadTasks();
  }
}
