import 'package:daily_goals/domain/models/task_model.dart';

abstract class TaskRepositoryInterface {
  Future<int> createTask(TaskModel task);
  Future<TaskModel> getTaskById(String id);
  Future<bool> existTaskByName(String name);
  Future<int> deleteTaskById(String id);
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> searchListTasks(String name);
}
