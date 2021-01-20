import 'dart:io';

import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/models/db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';

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
          'priority INT(1),'
          'id_category VARCHAR(300)'
          ')',
        );
        await db.execute(
          'CREATE TABLE Goal('
          'id VARCHAR(300) PRIMARY KEY,'
          'date VARCHAR(300),'
          'time VARCHAR(300),'
          'id_task VARCHAR(300),'
          'use_time INT(1),'
          'status INT(1)'
          ')',
        );
        await db.execute(
          'CREATE TABLE Category('
          'id VARCHAR(300) PRIMARY KEY,'
          'name VARCHAR(300),'
          'color VARCHAR(100),'
          'icon VARCHAR(100)'
          ')',
        );

        await db.rawInsert(
          'INSERT INTO Category VALUES (?,?,?,?)',
          ['001-001', 'Sport', 0xffff0606, 58726],
        );
      },
    );
  }

  //GLOBAL CRUD

  Future<int> createByModel(String table, DBModel model) async {
    final db = await database;
    final result = await db.insert(
      table,
      model.toJson(),
    );
    print(model.toJson());
    return result;
  }

  Future<bool> existByWhere(
      String table, String where, List<dynamic> whereArgs) async {
    final db = await database;
    final result = await db.rawQuery(
      'Select id FROM $table WHERE $where',
      whereArgs,
    );
    return result.isEmpty ? false : true;
  }

  Future<int> deleteById(String table, String id) async {
    final db = await database;
    final result = await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  ///TASK

  Future<TaskModel> getTaskById(String id) async {
    final db = await database;
    final result = await db.query(
      'Task',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? TaskModel.fromJson(result.first) : null;
  }

  Future<List<TaskModel>> getSearchListTasks(String name) async {
    final db = await database;
    final result =
        await db.rawQuery("SELECT * FROM TASK WHERE name LIKE '%$name%'");
    List<TaskModel> list = result.isNotEmpty
        ? result.map((task) => TaskModel.fromJson(task)).toList()
        : [];

    return list;
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

  Future<GoalModel> getGoalById(String id) async {
    final db = await database;
    final result = await db.query(
      'Goal',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? GoalModel.fromJson(result.first) : null;
  }

  Future<List<GoalModel>> getGoalsByWhere(String where, List whereArgs) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT Goal.id as id, Goal.date as date, Goal.status as status, Goal.id_task as id_task, Goal.time as time, Goal.use_time as use_time,'
      'Task.name as name_task, Task.description as description_task,'
      'Task.priority as priority_task FROM Goal JOIN Task ON Task.id = Goal.id_task WHERE $where ORDER BY Goal.time DESC',
      whereArgs,
    );
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

  Future<int> updateStatus(String id, int status) async {
    final db = await database;
    final result = await db.update(
      'Goal',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );

    return result;
  }

  // Category

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT Category.*, (SELECT COUNT(id) FROM task WHERE id_category = Category.id) as total FROM Category',
    );
    return result.isNotEmpty
        ? result.map((cat) => CategoryModel.fromJson(cat)).toList()
        : [];
  }
}
