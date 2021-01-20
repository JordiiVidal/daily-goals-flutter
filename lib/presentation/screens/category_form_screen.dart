import 'package:daily_goals/presentation/widgets/form/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:daily_goals/presentation/providers/category_form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/form/color_picker.dart';
import 'package:daily_goals/presentation/widgets/form/icon_picker.dart';
import 'package:daily_goals/presentation/widgets/form/submit_form.dart';

class CategoryFormScreen extends StatelessWidget {
  const CategoryFormScreen({Key key}) : super(key: key);

  void onSubmit(BuildContext context) async {
    final categoryFormProvider = context.read<CategoryFormProvider>();
    if (categoryFormProvider.errorName != null) return;
    final formCategory = categoryFormProvider.categoryState;
    await context
        .read<CategoryProvider>()
        .createCategory(CategoryModel.fromForm(formCategory));

    Navigator.pop(context);
  }

  void onChangeColor(BuildContext context, Color color) {
    FocusScope.of(context).unfocus();
    context.read<CategoryFormProvider>().setColor(color);
  }

  void onChangeIcon(BuildContext context, IconData iconData) {
    FocusScope.of(context).unfocus();
    context.read<CategoryFormProvider>().setIcon(iconData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider(
        create: (_) => CategoryFormProvider(),
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
                  hintText: '  Enter a new category  ',
                  onChanged: (text) =>
                      context.read<CategoryFormProvider>().setName(text),
                  errorText: context.watch<CategoryFormProvider>().errorName,
                ),
                const SizedBox(height: 30),
                ColorPicker(onTap: onChangeColor),
                const SizedBox(height: 15),
                IconPicker(onTap: onChangeIcon),
                const SizedBox(height: 30),
                Hero(
                  tag: 'btn-frm-ctg',
                  child: SubmitForm(
                    onTap: onSubmit,
                    title: 'Create Category',
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
