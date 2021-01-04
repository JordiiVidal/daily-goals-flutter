import 'package:daily_goals/domain/models/goal_model.dart';

abstract class GoalRepositoryInterface {
  Future<void> createGoal(GoalModel goal);
  Future<int> deleteGoal(String id);
  Future<List<GoalModel>> getGoalsByDate(String date);
}
