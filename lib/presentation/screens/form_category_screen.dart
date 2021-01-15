import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:daily_goals/presentation/providers/form_category_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/color_picker.dart';
import 'package:daily_goals/presentation/widgets/form/icon_picker.dart';
import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';

class FormCategoryScreen extends StatelessWidget {
  const FormCategoryScreen({Key key}) : super(key: key);

  void onSubmit(BuildContext context) async {
    final formCategory = context.read<FormCategoryProvider>().categoryState;
    final created = await context
        .read<CategoryProvider>()
        .createCategory(CategoryModel.fromForm(formCategory));
    if (created) {
      Navigator.pop(context);
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Exist category with same name!'),
        ),
      );
    }
  }

  void onChangeColor(BuildContext context, Color color) {
    FocusScope.of(context).unfocus();
    context.read<FormCategoryProvider>().setColor(color);
  }

  void onChangeIcon(BuildContext context, IconData iconData) {
    FocusScope.of(context).unfocus();
    context.read<FormCategoryProvider>().setIcon(iconData);
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
          create: (_) => FormCategoryProvider(),
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
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SubmitForm(
                        onTap: onSubmit,
                        title: 'Create Category',
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
