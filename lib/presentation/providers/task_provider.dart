import 'package:flutter/material.dart';

import '../../domain/models/task_model.dart';
import '../../domain/repositories/task_respository.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepositoryInterface taskRepositoryInterface;
  TaskProvider(this.taskRepositoryInterface);

  List<TaskModel> _tasksList = <TaskModel>[];
  bool _isLoading = true;

  List<TaskModel> get tasksList => _tasksList;
  bool get isLoading => _isLoading;

  Future loadTasks() async {
    final result = await taskRepositoryInterface.getAllTasks();
    _tasksList = result;
    _isLoading = false;
    notifyListeners();
  }

  void createTask(TaskModel task) async {
    _isLoading = true;
    await taskRepositoryInterface.createTask(task);
    await loadTasks();
  }

  Future<TaskModel> getById(String id) async =>
      taskRepositoryInterface.getTaskById(id);

  void deleteById(String id) async {
    _isLoading = true;
    await taskRepositoryInterface.deleteTaskById(id);
    await loadTasks();
  }

}
