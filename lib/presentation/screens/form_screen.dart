import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/form_provider.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/date_time_picker.dart';
import 'package:daily_goals/presentation/widgets/form/exigency_chips.dart';
import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';

class FormScreen extends StatelessWidget {
  const FormScreen();

  void onSubmit(BuildContext context) async {
    final formModel = context.read<FormProvider>().formState;
    final task = TaskModel.fromForm(formModel);
    await context.read<TaskProvider>().createTask(task);
    final goal = GoalModel.fromForm(formModel, task.id);
    await context.read<GoalProvider>().createGoal(goal);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (_) => FormProvider(),
        builder: (context, _) => Stack(
          children: [
            Padding(
              padding: AppPadding.form,
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
                  NameTextField(
                    onChangeText: (text) =>
                        context.read<FormProvider>().setName(text),
                    hintText: ' Enter a new task ',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ExigencyChips(),
                  DateTimePicker(),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: 25,
              right: 25,
              child: SubmitForm(
                onTap: onSubmit,
                title: 'Create Task',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
