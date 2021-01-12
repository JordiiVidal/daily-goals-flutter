import 'package:daily_goals/presentation/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 21,
      ),
      cursorWidth: 2,
      onChanged: (text) => context.read<FormProvider>().setName(text),
      decoration: InputDecoration(
        hintText: ' Enter a new task ',
        border: InputBorder.none,
      ),
    );
  }
}
