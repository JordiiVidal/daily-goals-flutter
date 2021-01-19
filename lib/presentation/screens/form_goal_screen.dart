import 'package:daily_goals/presentation/widgets/form/category_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/date_time_picker.dart';
import 'package:daily_goals/presentation/widgets/form/exigency_chips.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';

class FormGoalScreen extends StatelessWidget {
  void onSubmit(BuildContext context) async {
    final formProvider = context.read<GoalFormProvider>();
    if (formProvider.errorName != null) return;
    final formModel = formProvider.formState;
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
      child: ChangeNotifierProvider(
        create: (_) => GoalFormProvider(),
        builder: (context, _) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: SingleChildScrollView(
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
                TextFormField(
                  style: TextStyle(fontSize: 21),
                  cursorWidth: 2,
                  autovalidate: true,
                  onChanged: (text) =>
                      context.read<GoalFormProvider>().setName(text),
                  decoration: InputDecoration(
                    hintText: '  Enter a new task  ',
                    errorText: context.watch<GoalFormProvider>().errorName,
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 30),
                PriorityChips(),
                DateTimePicker(),
                CategoryChips(),
                const SizedBox(height: 30),
                Hero(
                  tag: 'btn-frm',
                  child: SubmitForm(
                    onTap: onSubmit,
                    title: 'Create Task',
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
