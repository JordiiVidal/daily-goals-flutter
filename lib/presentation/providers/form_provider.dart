import 'package:flutter/cupertino.dart';

import '../../domain/models/form_model.dart';
import '../../domain/models/task_model.dart';

class FormProvider extends ChangeNotifier {
  final FormModel _formState = FormModel();
  final List<Exigency> _chipsItems = [
    Exigency.Low,
    Exigency.Medium,
    Exigency.High,
  ];

  FormModel get formState => _formState;
  List<Exigency> get chipsItems => _chipsItems;
  int get exigencyState => _formState.exigency.index;
  DateTime get timeForm => _formState.time;
  DateTime get dateForm => _formState.date;
  bool get useTime => _formState.useTime;
  String get categoryState => _formState.idCategory;

  void setExigency(int index) {
    _formState.exigency = _chipsItems[index];
    notifyListeners();
  }

  void setCategory(String idCategory) {
    _formState.idCategory = idCategory;
    notifyListeners();
  }

  void setTime(DateTime dateTime, {bool useTime = true}) {
    _formState.time = dateTime;
    _formState.useTime = useTime;
    print('${_formState.time} -  SET TIME');
    notifyListeners();
  }

  void setDate(DateTime dateTime) {
    _formState.date = dateTime;
    notifyListeners();
  }

  void setName(String name) => _formState.name = name;
}
