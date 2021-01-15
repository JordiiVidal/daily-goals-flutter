import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepositoryInterface {
  static final String table = 'Category';

  @override
  Future<List<CategoryModel>> getAllCategories() =>
      DBLocalStorage.db.getAllCategories();

  @override
  Future<void> createCategory(CategoryModel category) =>
      DBLocalStorage.db.createByModel(table, category);

  @override
  Future<void> deleteCategory(String id) =>
      DBLocalStorage.db.deleteById(table, id);
}
