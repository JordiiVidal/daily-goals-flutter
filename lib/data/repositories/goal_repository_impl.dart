import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';
import 'package:daily_goals/presentation/widgets/helpers.dart';

class GoalRepositoryImpl extends GoalRepositoryInterface {
  @override
  Future<void> createGoal(GoalModel goal) async {
    final bool exist = await DBLocalStorage.db
        .existGoalWhere('id_task = ? AND date = ?', [goal.idTask, Formatter.db(goal.date)]);
    print(exist);
    if (!exist) await DBLocalStorage.db.createGoal(goal);
  }

  @override
  Future<int> deleteGoalById(String id) async =>
      await DBLocalStorage.db.deleteGoalById(id);

  @override
  Future<List<GoalModel>> getGoalsByDate(String date) async =>
      await DBLocalStorage.db.getGoalsByDate(date);

  @override
  Future<int> updateStatus(String id, int status) async =>
      await DBLocalStorage.db.updateStatus(id, status);

}
