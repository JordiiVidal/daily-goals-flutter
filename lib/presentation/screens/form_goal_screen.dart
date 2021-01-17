import 'package:daily_goals/presentation/widgets/form/category_chips.dart';
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

class FormGoalScreen extends StatelessWidget {
  const FormGoalScreen();

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: ChangeNotifierProvider(
          create: (_) => FormProvider(),
          builder: (context, _) => Padding(
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
                CategoryChips(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                        tag: 'btn-frm',
                        child: SubmitForm(
                          onTap: onSubmit,
                          title: 'Create Task',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
