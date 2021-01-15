import 'package:daily_goals/domain/models/form_category_model.dart';
import 'package:flutter/cupertino.dart';

class FormCategoryProvider extends ChangeNotifier {
  final FormCategoryModel _categoryState = FormCategoryModel();

  FormCategoryModel get categoryState => _categoryState;
  String get name => _categoryState.name;
  Color get color => _categoryState.color;
  IconData get iconData => _categoryState.icon;

  void setIcon(IconData icon) {
    _categoryState.icon = icon;
    notifyListeners();
  }

  void setColor(Color color) {
    _categoryState.color = color;
    notifyListeners();
  }

  void setName(String name) => _categoryState.name = name;
}
