import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/domain/models/form_category_model.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:daily_goals/presentation/providers/form_category_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/color_picker.dart';
import 'package:daily_goals/presentation/widgets/form/icon_picker.dart';
import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormCategoryScreen extends StatelessWidget {
  const FormCategoryScreen({Key key}) : super(key: key);

  void onSubmit(BuildContext context) async {
    final formCategory = context.read<FormCategoryProvider>().categoryState;
    await context.read<CategoryProvider>().createCategory(CategoryModel.fromForm(formCategory));

    Navigator.pop(context);
  }

  void onChangeColor(BuildContext context, Color color) =>
      context.read<FormCategoryProvider>().setColor(color);

  void onChangeIcon(BuildContext context, IconData iconData) =>
      context.read<FormCategoryProvider>().setIcon(iconData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (_) => FormCategoryProvider(),
        builder: (context, _) => Padding(
          padding: AppPadding.form,
          child: Stack(
            children: [
              Column(
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
                        context.read<FormCategoryProvider>().setName(text),
                    hintText: ' Enter a new category ',
                  ),
                  const SizedBox(height: 30),
                  ColorPicker(
                    onTap: onChangeColor,
                  ),
                  const SizedBox(height: 15),
                  IconPicker(
                    onTap: onChangeIcon,
                  )
                ],
              ),
              Positioned(
                bottom: 25,
                left: 25,
                right: 25,
                child: SubmitForm(
                  onTap: onSubmit,
                  title: 'Create Category',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
