import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepositoryInterface {
  @override
  Future<List<CategoryModel>> getAllCategories() =>
      DBLocalStorage.db.getAllCategories();
}
