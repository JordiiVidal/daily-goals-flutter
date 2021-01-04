// import 'package:daily_goals/presentation/providers/task_provider.dart';
// import 'package:provider/provider.dart';

// import '../domain/models/task_model.dart';
// import 'package:flutter/material.dart';

// class ActivityPage extends StatelessWidget {
//   static const routeName = '/profile-activity';
//   const ActivityPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String idActivity =
//         ModalRoute.of(context).settings.arguments as String;
//     final Activity activity =
//         Provider.of<ActivityProvider>(context).getById(idActivity);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(activity.name),
//       ),
//     );
//   }
// }
