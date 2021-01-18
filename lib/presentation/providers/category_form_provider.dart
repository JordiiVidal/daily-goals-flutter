import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/data/datasources/local_data.dart';
import 'package:daily_goals/domain/models/category_form_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryFormProvider extends ChangeNotifier {
  final CategoryFormModel _categoryState = CategoryFormModel(
    color: pickerColors[0],
    icon: pickerIcons[0],
  );

  String _errorName = '';

  String get errorName => _errorName;
  CategoryFormModel get categoryState => _categoryState;
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

  void setName(String name) async {
    _categoryState.name = name;
    if (name == null || name == "" || name.length < 3) {
      _errorName = 'Minimum 3 characters';
    } else {
      final exist =
          await DBLocalStorage.db.existByWhere('Category', 'name = ?', [name]);
      _errorName = exist ? 'Existed Category' : null;
    }
    notifyListeners();
  }
}
