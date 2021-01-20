import 'package:daily_goals/domain/models/goal_model.dart';

abstract class GoalRepositoryInterface {
  Future<void> createGoal(GoalModel goal);
  Future<int> deleteGoalById(String id);
  Future<List<GoalModel>> getGoalsByDate(String date);
  Future<int> updateStatus(String id, int status);
  Future<List<GoalModel>> getGoalsByTask(String idTask);
}
