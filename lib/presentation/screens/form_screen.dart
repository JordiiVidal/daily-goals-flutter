import 'package:daily_goals/presentation/providers/form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/date_time_picker.dart';
import 'package:daily_goals/presentation/widgets/form/exigency_chips.dart';
import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  void createTask() async {}

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
                    onChangeText: (t) =>
                        context.read<FormProvider>().setName(t),
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
              child: SubmitForm(),
            ),
          ],
        ),
      ),
    );
  }
}
