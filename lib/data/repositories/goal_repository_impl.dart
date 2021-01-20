import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';
import 'package:daily_goals/presentation/helpers.dart';

class GoalRepositoryImpl extends GoalRepositoryInterface {
  static final String table = 'Goal';
  @override
  Future<void> createGoal(GoalModel goal) async {
    final exist = await DBLocalStorage.db.existByWhere(
      table,
      'date = ? AND id_task = ?',
      [Formatter.db(goal.date), goal.idTask],
    );
    if (!exist) await DBLocalStorage.db.createByModel(table, goal);
  }

  @override
  Future<int> deleteGoalById(String id) async =>
      await DBLocalStorage.db.deleteById(table, id);

  @override
  Future<List<GoalModel>> getGoalsByDate(String date) async =>
      await DBLocalStorage.db.getGoalsByWhere('Goal.date = ?', [date]);

  @override
  Future<int> updateStatus(String id, int status) async =>
      await DBLocalStorage.db.updateStatus(id, status);

  @override
  Future<List<GoalModel>> getGoalsByTask(String idTask) async =>
      await DBLocalStorage.db.getGoalsByWhere('Goal.id_task = ?', [idTask]);
}
