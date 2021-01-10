import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

class ButtonTask extends StatelessWidget {
  const ButtonTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textColor: Colors.white,
      color: AppColors.primaryColor,
      onPressed: () => Navigator.pushNamed(context, AppRoutes.createTask),
      child: const Center(
        child: Text(
          'Create Task',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
