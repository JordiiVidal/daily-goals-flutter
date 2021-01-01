import '../models/activity.dart';
import 'package:flutter/material.dart';

class CheckBoxExigency extends StatelessWidget {
  final int indexSelected;
  final Exigency exigency;
  final Function onChange;
  const CheckBoxExigency(
      {Key key, this.indexSelected, this.exigency, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: indexSelected == exigency.index ? true : false,
      title: Text(exigency.toString()),
      onChanged: (_) => onChange(exigency.index),
    );
  }
}
