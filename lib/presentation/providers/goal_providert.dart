import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';

class GoalProvider extends ChangeNotifier {
  final GoalRepositoryInterface goalRepositoryInterface;
  GoalProvider(this.goalRepositoryInterface);

  List<GoalModel> _goalsDate = <GoalModel>[];
  String _selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  bool _isLoading = true;

  List<GoalModel> get goalsDate => _goalsDate;
  DateTime get selectedDate => DateTime.parse(_selectedDate);
  String get selectedDateString => _selectedDate;
  String get selectedDateText =>
      DateFormat.yMMMMd().format(DateTime.parse(_selectedDate));
      String get selectedDateyMd =>
      DateFormat.yMd().format(DateTime.parse(_selectedDate));

  bool get isLoading => _isLoading;

  Future<void> changeSelectedDate(DateTime selected) async {
    _isLoading = true;
    _selectedDate = DateFormat("yyyy-MM-dd").format(selected);
    await loadGoals();
  }

  Future<void> loadGoals() async {
    final result = await goalRepositoryInterface.getGoalsByDate(_selectedDate);
    _goalsDate = result;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createGoal(GoalModel goal) async {
    _isLoading = true;
    await goalRepositoryInterface.createGoal(goal);
    await loadGoals();
  }

  void deleteGoalById(String id) async {
    _isLoading = true;
    await goalRepositoryInterface.deleteGoalById(id);
    await loadGoals();
  }

  void updateStatus(String id, Status status) async {
    await goalRepositoryInterface.updateStatus(id, status.index);
    await loadGoals();
  }
}
