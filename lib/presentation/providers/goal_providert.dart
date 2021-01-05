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

  ///TODO VALUE NOTIFIER

  List<GoalModel> get goalsDate => _goalsDate;
  DateTime get selectedDate => DateTime.parse(_selectedDate);
  String get selectedDateText => _selectedDate;
  bool get isLoading => _isLoading;

  void changeSelectedDate(DateTime selected) async {
    _isLoading = true;
    _selectedDate = DateFormat("yyyy-MM-dd").format(selected);
    await loadGoals();
    notifyListeners();
  }

  Future loadGoals() async {
    final result = await goalRepositoryInterface.getGoalsByDate(_selectedDate);
    _goalsDate = result;
    _isLoading = false;
    notifyListeners();
  }

  Future createGoal(GoalModel goal) async {
    _isLoading = true;
    await goalRepositoryInterface.createGoal(goal);
    await loadGoals();
    notifyListeners();
  }
}
