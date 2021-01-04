// import 'package:daily_goals/presentation/providers/task_provider.dart';
// import 'package:daily_goals/providers/goals_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../domain/models/task_model.dart';

// class CheckBoxActivityItem extends StatelessWidget {
//   final Activity activity;
//   const CheckBoxActivityItem({Key key, this.activity}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       value:  Provider.of<GoalsProvider>(context).isCheckedActivity(activity.id),
//       onChanged: (val) =>
//           Provider.of<GoalsProvider>(context,listen: false).onChangeCheck(activity.id),
//       title: Text(activity.name),
//     );
//   }
// }
