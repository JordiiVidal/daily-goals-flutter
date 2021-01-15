import 'package:daily_goals/domain/models/category_model.dart';

abstract class CategoryRepositoryInterface {
  Future<List<CategoryModel>> getAllCategories();
  Future<void> createCategory(CategoryModel categoryModel);
  Future<void> deleteCategory(String id);
}
