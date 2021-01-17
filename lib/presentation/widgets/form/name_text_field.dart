import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class NameTextField extends StatefulWidget {
  final Function onChangeText;
  final String hintText;

  const NameTextField({@required this.hintText, @required this.onChangeText});

  @override
  _NameTextFieldState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  TextEditingController _textController;
  FocusNode _textFocusNode;

  @override
  void initState() {
    _textController = TextEditingController();
    _textFocusNode = FocusNode();
    KeyboardVisibilityNotification()
        .addNewListener(onHide: () => FocusScope.of(context).unfocus());
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _textFocusNode,
      controller: _textController,
      style: TextStyle(
        fontSize: 21,
      ),
      cursorWidth: 2,
      onChanged: widget.onChangeText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
      ),
      onSubmitted: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
