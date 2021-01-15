import 'package:daily_goals/data/datasources/local_data.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final Function onTap;
  const ColorPicker({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pick color',
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pickerColors.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                onTap: () => onTap(context, pickerColors[i]),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: pickerColors[i],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
