import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/task_model.dart';

import 'package:daily_goals/domain/repositories/task_respository.dart';

class TaskRepositoryImpl extends TaskRepositoryInterface {
  static final String table = 'Task';
  @override
  Future<int> createTask(TaskModel task) async {
    final exist = await DBLocalStorage.db.existByWhere(
      table,
      'name = ?',
      [task.name],
    );
    if (!exist) await DBLocalStorage.db.createByModel(table, task);
    return 1;
  }

  @override
  Future<TaskModel> getTaskById(String id) async =>
      await DBLocalStorage.db.getTaskById(id);

  @override
  Future<int> deleteTaskById(String id) async =>
      await DBLocalStorage.db.deleteById(table, id);

  @override
  Future<List<TaskModel>> getAllTasks() async =>
      await DBLocalStorage.db.getAllTasks();

  @override
  Future<List<TaskModel>> searchListTasks(String name) async =>
      await DBLocalStorage.db.getSearchListTasks(name);

  @override
  Future<bool> existTaskByName(String name) async =>
      await DBLocalStorage.db.existByWhere(table, 'name = ?', [name]);
}
