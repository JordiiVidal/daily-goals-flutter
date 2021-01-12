import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/calendar_picker.dart';
import 'package:daily_goals/presentation/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chips_choice/chips_choice.dart';

class TaskFormCreate extends StatefulWidget {
  @override
  _TaskFormCreateState createState() => _TaskFormCreateState();
}

class _TaskFormCreateState extends State<TaskFormCreate> {
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

  void saveForm() async {
    final String date = context.read<GoalProvider>().selectedDateString;
    final task = TaskModel(
      exigency: _exigencies[_indexSelected],
      name: _nameController.text,
    );
    await context.read<TaskProvider>().createTask(task);
    await context.read<GoalProvider>().createGoal(
          GoalModel.fromTask(task, date),
        );
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
                  fontSize: 40,
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
                  hintText: ' Enter a new task',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Exigency',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ChipsChoice<int>.single(
                padding: const EdgeInsets.all(0),
                value: _indexSelected,
                choiceBuilder: (item) {
                  return CustomChip(
                    label: item.label,
                    width: 90,
                    height: 35,
                    color: AppColors.accentColor,
                    selected: item.selected,
                    onSelect: item.select,
                  );
                },
                onChanged: (val) => setState(() => _indexSelected = val),
                choiceItems: C2Choice.listFrom<int, Exigency>(
                  source: _exigencies,
                  value: (i, v) => v.index,
                  label: (i, v) => exigencyToString(v),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               const Text(
                'Choose date & time',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CalendarPicker(),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: MaterialButton(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textColor: Colors.white,
            color: AppColors.primaryColor,
            onPressed: saveForm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('New Task'),
                const SizedBox(width: 20),
                const Icon(Icons.add),
              ],
            ),
          ),
        )
      ],
    );
  }
}
