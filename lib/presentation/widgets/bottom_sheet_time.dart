import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class BottomSheetTime extends StatelessWidget {
  final DateTime initDateTime;
  final Function onTimeChange;
  const BottomSheetTime({this.initDateTime, this.onTimeChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TimePickerSpinner(
                time: initDateTime,
                isForce2Digits: true,
                minutesInterval: 5,
                is24HourMode: true,
                spacing: 10,
                normalTextStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.secondaryTextColor,
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 25,
                  color: AppColors.primaryColor,
                ),
                onTimeChange: (time) => onTimeChange(time),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Clear'),
                    onPressed: () {
                      onTimeChange(initDateTime, useTime: false);
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Last Time'),
                    onPressed: () {
                      onTimeChange(initDateTime);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
