import 'package:daily_goals/domain/models/task_model.dart';
import 'package:flutter/material.dart';

class DetailsTaskScreen extends StatelessWidget {
  const DetailsTaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context).settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(child: Text(task.name)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.delete),
      ),
    );
  }
}
