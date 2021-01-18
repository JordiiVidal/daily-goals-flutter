import 'package:flutter/material.dart';

import '../theme.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No task scheduled',
        style: TextStyle(
          fontSize: 30,
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }
}
