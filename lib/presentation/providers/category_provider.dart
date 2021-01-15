import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/repositories/category_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepositoryInterface categoryRepositoryInterface;
  CategoryProvider(this.categoryRepositoryInterface);

  List<CategoryModel> _categoryList = <CategoryModel>[];
  List<CategoryModel> get categoryList => _categoryList;

  Future<void> loadCategories() async {
    _categoryList = await categoryRepositoryInterface.getAllCategories();
    notifyListeners();
  }

  Future<void> createCategory(CategoryModel categoryModel) async {
    await categoryRepositoryInterface.createCategory(categoryModel);
    loadCategories();
  }

  Future<void> delteCategory(String id) async {
    await categoryRepositoryInterface.deleteCategory(id);
    loadCategories();
  }
}
