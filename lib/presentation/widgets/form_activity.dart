import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chips_choice/chips_choice.dart';
import 'package:daily_goals/widgets/back_button.dart';


class FormCreateTask extends StatefulWidget {
  @override
  _FormCreateTaskState createState() => _FormCreateTaskState();
}

class _FormCreateTaskState extends State<FormCreateTask> {
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
    final task = TaskModel(
      exigency: _exigencies[_indexSelected],
      name: _nameController.text,
    );
    context.read<TaskProvider>().createTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextField(
                controller: _nameController,
                style: TextStyle(
                  fontSize: 21,
                ),
                cursorWidth: 2,
                decoration: InputDecoration(
                  hintText: ' Enter a new activity',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ChipsChoice<int>.single(
                padding: const EdgeInsets.all(0),
                value: _indexSelected,
                choiceStyle: C2ChoiceStyle(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  borderColor: Colors.grey[300],
                  elevation: 2,
                ),
                choiceActiveStyle: C2ChoiceStyle(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  borderColor: Colors.blue,
                  elevation: 0,
                ),
                onChanged: (val) => setState(() => _indexSelected = val),
                choiceItems: C2Choice.listFrom<int, Exigency>(
                  source: _exigencies,
                  value: (i, v) => v.index,
                  label: (i, v) => exigencyToString(v),
                ),
              ),
            ],
          ),
        ),
        TopBackButton(),
        Positioned(
          bottom: 30,
          right: 30,
          child: MaterialButton(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: saveForm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('New activity'),
                const SizedBox(width: 20),
                const Icon(Icons.keyboard_arrow_up),
              ],
            ),
          ),
        )
      ],
    );
  }
}
