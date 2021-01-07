import 'package:flutter/material.dart';

class TopBackButton extends StatelessWidget {
  const TopBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right:30,
      top: 30,
      child: FloatingActionButton(
        mini: true,
        elevation: 3,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.close,
          color: Colors.black87,
          size: 19,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
