import '../widgets/form_activity.dart';
import 'package:flutter/material.dart';

class AddActivityPage extends StatelessWidget {
  static const routeName = '/add-activity';
  const AddActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormActivity(),
      ),
    );
  }
}
