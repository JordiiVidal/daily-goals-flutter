import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/date_time_picker.dart';
import 'package:daily_goals/presentation/widgets/form/exigency_chips.dart';

import 'package:daily_goals/presentation/providers/main_providert.dart';

class TaskFormScreen extends StatelessWidget {
  void onSubmit(BuildContext context) async {
    final formProvider = context.read<GoalFormProvider>();
    if (formProvider.errorName != null) return;
    final formModel = formProvider.formState;
    await context.read<MainProvider>().createTaskGoal(formModel);
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
            heroTag: 'fab',
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
