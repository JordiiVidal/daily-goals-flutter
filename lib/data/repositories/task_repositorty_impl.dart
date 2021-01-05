import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/task_model.dart';

import 'package:daily_goals/domain/repositories/task_respository.dart';

class TaskRepositoryImpl extends TaskRepositoryInterface {
  @override
  Future<int> createTask(TaskModel task) async =>
      await DBLocalStorage.db.createTask(task);

  @override
  Future<TaskModel> getTaskById(String id) async =>
      await DBLocalStorage.db.getTaskById(id);

  @override
  Future<int> deleteTaskById(String id) async =>
      await DBLocalStorage.db.deleteTaskById(id);

  @override
  Future<List<TaskModel>> getAllTasks() async => await DBLocalStorage.db.getAllTasks();

}
