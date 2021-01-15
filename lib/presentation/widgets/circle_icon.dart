import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final int color;
  final IconData iconData;

  const CircleIcon({Key key, this.color, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Color(color),
      ),
      child: Icon(
        iconData,
        color: Color(0XFFFFFFFF),
        size: 18,
      ),
    );
  }
}
