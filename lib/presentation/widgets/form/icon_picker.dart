import 'package:flutter/material.dart';

import 'package:daily_goals/data/datasources/local_data.dart';

class IconPicker extends StatelessWidget {
  final Function onTap;
  const IconPicker({@required this.onTap});

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
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pickerIcons.length,
            itemBuilder: (_, i) => IconButton(
              icon: Icon(
                pickerIcons[i],
                color: Colors.white,
              ),
              onPressed: () => onTap(context, pickerIcons[i]),
            ),
          ),
        )
      ],
    );
  }
}
