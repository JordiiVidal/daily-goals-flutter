import 'package:daily_goals/data/datasources/local_data.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final Function onTap;
  const ColorPicker({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    final selectedColor = pickerColors[0];
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
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutCirc,
                  width: selectedColor == pickerColors[i] ? 80 : 40,
                  height: 20,
                  color: selectedColor == pickerColors[i]
                      ? pickerColors[i]
                      : pickerColors[i].withOpacity(0.7),
                  child: selectedColor == pickerColors[i]
                      ? Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      : Text(''),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
