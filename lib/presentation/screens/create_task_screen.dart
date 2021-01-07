import 'package:flutter/material.dart';

import 'package:daily_goals/presentation/widgets/form_activity.dart';

class CreateTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormCreateTask(),
      ),
    );
  }
}
