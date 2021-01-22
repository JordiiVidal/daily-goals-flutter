import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/date_time_picker.dart';
import 'package:daily_goals/presentation/widgets/form/exigency_chips.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';

class GoalFormScreen extends StatelessWidget {
  void onSubmit(BuildContext context) async {
    ///TODO IMPROVE THIS CODE
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
                NameTextField(
                  hintText: '  Enter a new task  ',
                  onChanged: (text) =>
                      context.read<GoalFormProvider>().setName(text),
                  errorText: context.watch<GoalFormProvider>().errorName,
                ),
                const SizedBox(height: 30),
                PriorityChips(),
                DateTimePicker(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => onSubmit(context),
            heroTag: 'btn-frm',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Container(
              width: MediaQuery.of(context).size.width - 72,
              child: Center(
                child: Text(
                  'Create Task',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
