import 'package:flutter/material.dart';

import '../../theme.dart';

class ItemPicker extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final String text;
  const ItemPicker({Key key, this.onTap, this.iconData, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: AppColors.secondaryTextColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 17,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
