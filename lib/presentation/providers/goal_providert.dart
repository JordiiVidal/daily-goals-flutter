import 'package:flutter/material.dart';

import '../helpers.dart';

import '../../domain/repositories/goal_repository.dart';
import '../../domain/models/goal_model.dart';

class GoalProvider extends ChangeNotifier {
  final GoalRepositoryInterface goalRepositoryInterface;
  GoalProvider(this.goalRepositoryInterface);

  List<GoalModel> _goalsList = <GoalModel>[];
  DateTime _selectedDate = DateTime.now();

  List<GoalModel> get goalsList => _goalsList;
  DateTime get selectedDate => _selectedDate;

  Future<void> setSelectedDate(DateTime dateTime) async {
    _selectedDate = dateTime;
    await loadGoals();
  }

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
