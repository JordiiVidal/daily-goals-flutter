import 'package:flutter/material.dart';

import '../../domain/models/task_model.dart';
import '../../domain/repositories/task_respository.dart';


class TaskProvider extends ChangeNotifier {
  final TaskRepositoryInterface taskRepositoryInterface;
  TaskProvider(this.taskRepositoryInterface);

  List<TaskModel> _tasksList = <TaskModel>[];
  List<TaskModel> get tasksList => _tasksList;

  Future<void> loadTasks() async {
    final result = await taskRepositoryInterface.getAllTasks();
    _tasksList = result;
    notifyListeners();
  }

  Future<void> createTask(TaskModel task) async {
    await taskRepositoryInterface.createTask(task);
    await loadTasks();
  }

  Future<TaskModel> getById(String id) async =>
      taskRepositoryInterface.getTaskById(id);

  Future<void> deleteById(String id) async {
    await taskRepositoryInterface.deleteTaskById(id);
    await loadTasks();
  }

  Future<List<TaskModel>> searchListTasks(String name) async =>
      taskRepositoryInterface.searchListTasks(name);
}
