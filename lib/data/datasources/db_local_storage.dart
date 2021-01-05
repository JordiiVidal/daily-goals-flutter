import 'dart:io';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBLocalStorage {
  static Database _database;
  static final DBLocalStorage db = DBLocalStorage._private();

  DBLocalStorage._private();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'DailyGoals.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Task('
          'id VARCHAR(300) PRIMARY KEY,'
          'name VARCHAR(300),'
          'description TEXT,'
          'exigency INT(1)'
          ')',
        );
        await db.execute(
          'CREATE TABLE Goal('
          'id VARCHAR(300) PRIMARY KEY,'
          'date VARCHAR(300),'
          'id_task VARCHAR(300),'
          'status INT(1)'
          ')',
        );
      },
    );
  }

  Future<int> createTask(TaskModel task) async {
    final db = await database;
    final result = await db.insert(
      'Task',
      task.toJson(),
    );
    return result;
  }

  Future<TaskModel> getTaskById(String id) async {
    final db = await database;
    final result = await db.query(
      'Task',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? TaskModel.fromJson(result.first) : null;
  }

  Future<int> deleteTaskById(String id) async {
    final db = await database;
    final result = await db.delete(
      'Task',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> delteAllTasks() async {
    final db = await database;
    final result = await db.delete('Task');
    return result;
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await database;
    final result = await db.query('Task');
    List<TaskModel> list = result.isNotEmpty
        ? result.map((task) => TaskModel.fromJson(task)).toList()
        : [];

    return list;
  }

  //GOALS

  Future<int> createGoal(GoalModel goal) async {
    final db = await database;
    final result = await db.insert(
      'Goal',
      goal.toJson(),
    );
    return result;
  }

  Future<GoalModel> getGoalById(String id) async {
    final db = await database;
    final result = await db.query(
      'Goal',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? GoalModel.fromJson(result.first) : null;
  }

  Future<bool> existGoalWhere(String where, List<String> whereArgs) async {
    final db = await database;
    final result = await db.query(
      'Goal',
      where: where,
      whereArgs: whereArgs,
    );
    return result.isNotEmpty ? true : false;
  }

  Future<int> deleteGoalById(String id) async {
    final db = await database;
    final result = await db.delete(
      'Goal',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> delteAllGoals() async {
    final db = await database;
    final result = await db.delete('Goal');
    return result;
  }

  Future<List<GoalModel>> getGoalsByDate(String date) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM Goal JOIN Task ON Task.id = Goal.id_task WHERE Goal.date = ?',
      [date],
    );
    print(result);
    List<GoalModel> list = result.isNotEmpty
        ? result.map((goal) => GoalModel.fromJson(goal)).toList()
        : [];

    return list;
  }

  Future<List<GoalModel>> getAllGoals() async {
    final db = await database;
    final result = await db.query('Goal');
    List<GoalModel> list = result.isNotEmpty
        ? result.map((goal) => GoalModel.fromJson(goal)).toList()
        : [];

    return list;
  }
}
