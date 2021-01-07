import 'package:flutter/material.dart';

import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key key}) : super(key: key);

  void _showModalBottomSheetCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return BottomSheetCalendar();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: _statusBarHeight),
      decoration: BoxDecoration(
        color: Color(0xff4b6bf1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black38,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: AppColors.white,
                    size: 25,
                  ),
                  onPressed: () => null,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.alarm,
                          color: AppColors.white,
                          size: 25,
                        ),
                        onPressed: () => null,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: AppColors.white,
                          size: 25,
                        ),
                        onPressed: () => _showModalBottomSheetCalendar(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 16,
            ),
            child: Text(
              'Good Morning',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
