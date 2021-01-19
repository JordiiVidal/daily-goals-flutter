import 'package:daily_goals/presentation/providers/category_form_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/data/datasources/local_data.dart';

class IconPicker extends StatelessWidget {
  final Function onTap;
  const IconPicker({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    final iconSelected = context.watch<CategoryFormProvider>().iconData;
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
          height: 220,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 30,
            ),
            itemCount: pickerIcons.length,
            itemBuilder: (_, i) => GestureDetector(
              onTap: () => onTap(context, pickerIcons[i]),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: pickerIcons[i] == iconSelected
                        ? AppColors.primaryColor
                        : Colors.transparent),
                child: Center(
                  child: Icon(
                    pickerIcons[i],
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
//  ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: pickerIcons.length,
//             itemBuilder: (_, i) => GestureDetector(
//               onTap: () => onTap(context, pickerIcons[i]),
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: pickerIcons[i] == iconSelected
//                         ? AppColors.primaryColor
//                         : Colors.transparent),
//                 child: Center(
//                   child: Icon(
//                     pickerIcons[i],
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
