import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final Function onChangeText;
  final String hintText;

  const NameTextField({@required this.hintText, @required this.onChangeText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 21,
      ),
      cursorWidth: 2,
      onChanged: onChangeText,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
