import 'package:flutter/material.dart';
import '../../domain/models/task_model.dart';

class TaskItemList extends StatelessWidget {
  final TaskModel task;
  final Function onDismiss;
  const TaskItemList({this.task, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Dismissible(
        movementDuration: Duration(seconds: 2),
        direction: DismissDirection.endToStart,
        key: Key(task.id),
        onDismissed: (direction) => onDismiss(task.id),
        background: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlineButton(
                  onPressed: () => null,
                  child: Text(
                    'Delete',
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () => null,
            title: Text(task.name),
            trailing: Text('${task.exigency.index}'),
          ),
        ),
      ),
    );
  }
}
