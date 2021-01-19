import 'package:daily_goals/presentation/providers/goal_form_provider.dart';
import 'package:daily_goals/presentation/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_sheet_time.dart';
import '../../widgets/form/item_picker.dart';

import '../bottom_sheet_calendar.dart';

class DateTimePicker extends StatelessWidget {
  void _showModalBottomSheetCalendar(BuildContext context) {
    FocusScope.of(context).unfocus();
    final readFormProvider = context.read<GoalFormProvider>();
    showModalBottomSheet(
      context: context,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) => BottomSheetCalendar(
        closeOnClick: true,
        initDateTime: readFormProvider.dateForm,
        onDaySelected: readFormProvider.setDate,
      ),
    );
  }

  void _showModalBottomSheetTime(BuildContext context) {
    FocusScope.of(context).unfocus();
    final readFormProvider = context.read<GoalFormProvider>();
    showModalBottomSheet(
      context: context,
      elevation: 3,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (ctx) => BottomSheetTime(
        initDateTime: readFormProvider.timeForm,
        onTimeChange: readFormProvider.setTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = context.watch<GoalFormProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose date & time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              ItemPicker(
                onTap: () => _showModalBottomSheetCalendar(context),
                iconData: Icons.calendar_today,
                text: Formatter.ui(formProvider.dateForm),
              ),
              SizedBox(
                width: 10,
              ),
              ItemPicker(
                onTap: () => _showModalBottomSheetTime(context),
                iconData: Icons.timer,
                text: (formProvider.useTime)
                    ? Formatter.ui(formProvider.timeForm, time: true)
                    : 'Select Time',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
