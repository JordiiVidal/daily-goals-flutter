import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl extends GoalRepositoryInterface {
  @override
  Future<void> createGoal(GoalModel goal) async =>
      await DBLocalStorage.db.createGoal(goal);

  @override
  Future<int> deleteGoal(String id) async => await DBLocalStorage.db.deleteGoalById(id);

  @override
  Future<List<GoalModel>> getGoalsByDate(String date) async => await DBLocalStorage.db.getGoalsByDate(date);
}
