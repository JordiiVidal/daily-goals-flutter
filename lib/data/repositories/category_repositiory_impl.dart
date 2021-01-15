import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepositoryInterface {
  static final String table = 'Category';

  @override
  Future<List<CategoryModel>> getAllCategories() =>
      DBLocalStorage.db.getAllCategories();

  @override
  Future<bool> createCategory(CategoryModel category) async {
    final exist = await DBLocalStorage.db.existByWhere(
      table,
      'name = ?',
      [category.name],
    );
    if (exist) return false;
    await DBLocalStorage.db.createByModel(table, category);
    return true;
  }

  @override
  Future<void> deleteCategory(String id) =>
      DBLocalStorage.db.deleteById(table, id);
}
