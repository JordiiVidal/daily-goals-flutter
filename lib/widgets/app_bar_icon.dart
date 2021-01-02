import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  const AppBarIcon({Key key, this.icon, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: IconButton(
        icon: FaIcon(
          icon,
          color: Colors.black54,
          size: 20,
        ),
        onPressed: onPress,
      ),
    );
  }
}
