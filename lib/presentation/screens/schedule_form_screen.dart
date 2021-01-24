import 'package:daily_goals/presentation/widgets/form/task_select.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ScheduleFormScreen extends StatelessWidget {
  const ScheduleFormScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: AppPadding.form,
              child: const Text(
                'Schedule',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TaskSelect(),
          ],
        ),
      ),
    );
  }
}
