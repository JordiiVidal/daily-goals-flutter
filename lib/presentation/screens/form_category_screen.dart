import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/color_picker.dart';
import 'package:daily_goals/presentation/widgets/form/icon_picker.dart';
import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:flutter/material.dart';

class FormCategoryScreen extends StatelessWidget {
  const FormCategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
              onChangeText: (s) => print(s),
              hintText: ' Enter a new category ',
            ),
            const SizedBox(
              height: 30,
            ),
            ColorPicker(),
            IconPicker()
          ],
        ),
      ),
    );
  }
}
