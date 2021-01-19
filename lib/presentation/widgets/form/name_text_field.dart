import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final Function onChanged;
  final String errorText;
  final String hintText;

  const NameTextField({
    @required this.onChanged,
    @required this.errorText,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 21,
      ),
      cursorWidth: 2,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        border: InputBorder.none,
      ),
    );
  }
}
