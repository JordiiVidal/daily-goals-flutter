import '../data/state.dart';
import '../models/activity.dart';
import '../widgets/checkbox_exigency.dart';
import 'package:flutter/material.dart';

class FormActivity extends StatefulWidget {
  FormActivity({Key key}) : super(key: key);

  @override
  _FormActivityState createState() => _FormActivityState();
}

class _FormActivityState extends State<FormActivity> {
  final _nameController = TextEditingController();
  static const List<Exigency> _exigencies = [
    Exigency.Low,
    Exigency.Medium,
    Exigency.High
  ];
  int _indexSelected = Exigency.Medium.index;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  void onChangeCheckBox(int selected) =>
      setState(() => _indexSelected = selected);

  void saveForm() {
    final newActivity = Activity(
      exigency: _exigencies[_indexSelected],
      name: _nameController.text,
    );
    addActivity(newActivity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name Activity'),
        TextField(controller: _nameController),
        Text('Exigency'),
        CheckBoxExigency(
          exigency: _exigencies[0],
          indexSelected: _indexSelected,
          onChange: onChangeCheckBox,
        ),
        CheckBoxExigency(
          exigency: _exigencies[1],
          indexSelected: _indexSelected,
          onChange: onChangeCheckBox,
        ),
        CheckBoxExigency(
          exigency: _exigencies[2],
          indexSelected: _indexSelected,
          onChange: onChangeCheckBox,
        ),
        MaterialButton(
          color: Colors.grey[200],
          onPressed: saveForm,
          child: Text('Create Activity'),
        )
      ],
    );
  }
}
