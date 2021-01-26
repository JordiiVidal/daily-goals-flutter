import 'package:daily_goals/domain/models/goal_form_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/domain/repositories/task_respository.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

import '../../domain/repositories/goal_repository.dart';
import '../../domain/models/goal_model.dart';

class MainProvider extends ChangeNotifier {
  final GoalRepositoryInterface goalRepositoryInterface;
  final TaskRepositoryInterface taskRepositoryInterface;

  MainProvider(this.goalRepositoryInterface, this.taskRepositoryInterface);

  List<GoalModel> _goalsList = <GoalModel>[];

  ///LIST OF GOALS SHOWEDS ON HOME SCREEN USING SELECTED DATE
  DateTime _selectedDate = DateTime.now();

  /// DATE SELECTED BY THE USER, PROVIDE LIST OF GOALS
  List<TaskModel> _tasksList = <TaskModel>[];

  /// ALL EXISTING DATA ABOUT TASK

  // @GETTERS

  List<GoalModel> get goalsList => _goalsList;
  DateTime get selectedDate => _selectedDate;
  List<TaskModel> get tasksList => _tasksList;

  /// INIT DATA

  Future<void> initData() async {
    await loadTasks();
    await loadGoals();
  }

  /// SELECTEDDATE

  Future<void> setSelectedDate(DateTime dateTime) async {
    _selectedDate = dateTime;
    await loadGoals();
  }

  //FORM

  Future<void> createTaskGoal(GoalFormModel formModel) async {
    final task = TaskModel.fromForm(formModel);
    await createTask(task);
    final goal = GoalModel.fromForm(formModel, task.id);
    await createGoal(goal);
  }

  /// TASK

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

  Future<bool> existName(String name) async =>
      await taskRepositoryInterface.existTaskByName(name);

  Future<List<TaskModel>> searchListTasks(String name) async =>
      taskRepositoryInterface.searchListTasks(name);

  Future<String> validateName(String name) async {
    if (name.length < 3) return 'Minimum 3 characters';
    final exist = await taskRepositoryInterface.existTaskByName(name);
    return (exist) ? 'This name was created' : '';
  }

  /// GOALS

  Future<void> loadGoals() async {
    final result = await goalRepositoryInterface
        .getGoalsByDate(Formatter.db(_selectedDate));
    _goalsList = result;
    notifyListeners();
  }

  Future<void> createGoal(GoalModel goal) async {
    await goalRepositoryInterface.createGoal(goal);
    await loadGoals();
  }

  Future<void> deleteGoalById(String id) async {
    await goalRepositoryInterface.deleteGoalById(id);
    await loadGoals();
  }

  Future<void> updateStatus(String id, Status status) async {
    await goalRepositoryInterface.updateStatus(id, status.index);
    await loadGoals();
  }
}
