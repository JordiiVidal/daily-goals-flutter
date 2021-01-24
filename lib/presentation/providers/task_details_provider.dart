import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class TaskDetailsProvider extends ChangeNotifier {
  final GoalRepositoryInterface goalRI;
  final TaskModel task;

  TaskDetailsProvider({this.goalRI, this.task});

  List<GoalModel> _register = [];
  List<CircularStackEntry> _data = <CircularStackEntry>[];
  String _holeLabel = '';

  List<GoalModel> get register => _register;
  List<CircularStackEntry> get data => _data;
  String get holeLabel => _holeLabel;

  void loadDetails() async {
    _register = await goalRI.getGoalsByTask(task.id);
    final result = loadData();
    _data = result['data'];
    _holeLabel = result['label'];
    notifyListeners();
  }

  Map<String, dynamic> loadData() {
    final int total = _register.length;
    int done = 0;
    _register.forEach((goal) {
      if (goal.status == Status.Done) done++;
    });
    final pending = total - done;
    final double donePercent = (done > 0) ? done * 100 / total : 0;
    final double pendingPercent =
        (donePercent == 0) ? 100 : pending * 100 / total;
    final doneChart = CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(
          donePercent,
          AppColors.secondaryAccentColor,
          rankKey: 'completed',
        ),
        new CircularSegmentEntry(
          pendingPercent,
          AppColors.primaryColor,
          rankKey: 'pending',
        ),
      ],
      rankKey: 'progress',
    );
    final pendingChart = CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(
          pendingPercent,
          total > 0 ? AppColors.accentColor : AppColors.primaryColor,
          rankKey: 'pending',
        ),
        new CircularSegmentEntry(
          donePercent,
          AppColors.primaryColor,
          rankKey: 'completed',
        ),
      ],
      rankKey: 'progress',
    );

    return {
      'data': [pendingChart, doneChart],
      'label': '$done/$total'
    };
  }
}
