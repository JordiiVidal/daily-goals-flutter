import 'package:daily_goals/domain/models/form_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:flutter/cupertino.dart';

class FormProvider extends ChangeNotifier {
  final FormModel _formState = FormModel();
  final List<Exigency> _chipsItems = [
    Exigency.Low,
    Exigency.Medium,
    Exigency.High,
  ];

  List<Exigency> get chipsItems => _chipsItems;
  int get exigencyState => _formState.exigency.index;

  void setExigency(int index) {
    _formState.exigency = _chipsItems[index];
    notifyListeners();
  }

  void setName(String name) => _formState.name = name;
}
