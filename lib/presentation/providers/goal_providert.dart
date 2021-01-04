import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';

class GoalProvider extends ChangeNotifier {
  final GoalRepositoryInterface goalRepositoryInterface;
  GoalProvider(this.goalRepositoryInterface);

  List<GoalModel> _goalsDate = <GoalModel>[];
  DateTime _selectedDate = DateTime.now();

  ///TODO VALUE NOTIFIER

  List<GoalModel> get goalsDate => _goalsDate;
  DateTime get selectedDate => _selectedDate;

  void changeSelectedDate(DateTime selected) async {
    _selectedDate = selected;
    await _loadGoals();
    notifyListeners();
  }

  Future _loadGoals() async {
    final result = await goalRepositoryInterface.getGoalsByDate(
      DateFormat('Y-m-d').format(_selectedDate),
    );
    _goalsDate = result;
    notifyListeners();
  }

  void getGoalsByDate() async {
    await _loadGoals();
  }

  void createGoal(GoalModel goal) async {
    await goalRepositoryInterface.createGoal(goal);
    _goalsDate.add(goal);
    notifyListeners();
  }
}
