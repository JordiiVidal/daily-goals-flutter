import 'package:flutter/material.dart';

class IconPicker extends StatelessWidget {
  const IconPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose icon',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          child: Row(
            children: [CircleAvatar(radius: 30)],
          ),
        )
      ],
    );
  }
}
