import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/repositories/category_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepositoryInterface categoryRepositoryInterface;
  CategoryProvider(this.categoryRepositoryInterface);

  List<CategoryModel> _categoryList = <CategoryModel>[];
  List<CategoryModel> get categoryList => _categoryList;

  int getColorById(String id) {
    final _category = _categoryList.firstWhere((element) => element.id == id);
    return (_category != null) ? _category.color : 0XFFeb06ff;
  }

  Future<void> loadCategories() async {
    _categoryList = await categoryRepositoryInterface.getAllCategories();
    notifyListeners();
  }

  Future<bool> createCategory(CategoryModel categoryModel) async {
    await categoryRepositoryInterface.createCategory(categoryModel);
    await loadCategories();
    return true;
  }

  Future<void> delteCategory(String id) async {
    await categoryRepositoryInterface.deleteCategory(id);
    _categoryList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
