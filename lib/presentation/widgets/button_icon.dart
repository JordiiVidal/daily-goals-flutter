import 'package:flutter/material.dart';

import '../theme.dart';

class ButtonIcon extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  const ButtonIcon({
    @required this.onTap,
    @required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 20);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
