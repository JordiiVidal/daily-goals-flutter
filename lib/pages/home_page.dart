import 'package:daily_goals/models/activity.dart';
import 'package:daily_goals/pages/activity_list_page.dart';
import 'package:daily_goals/pages/calendar_page.dart';
import 'package:daily_goals/pages/menu_page.dart';
import 'package:daily_goals/widgets/activity_litem_list.dart';
import 'package:daily_goals/widgets/app_bar_icon.dart';
import 'package:daily_goals/widgets/bottom_sheet_calendar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_goal_page.dart';
import '../providers/goals_provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key key}) : super(key: key);

  void _showModalBottomSheetCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetCalendar();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBarIcon(
          icon: FontAwesomeIcons.bars,
          onPress: () =>
              Navigator.pushNamed(context, MenuPage.routeName),
        ),
        actions: [
          Center(
            child: Consumer<GoalsProvider>(
              builder: (_, provider, __) {
                return Text(
                  DateFormat.yMMMd().format(provider.selectDateTime),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                );
              },
            ),
          ),
          AppBarIcon(
            icon: FontAwesomeIcons.calendar,
            onPress: () => _showModalBottomSheetCalendar(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              ' TASKS',
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            Expanded(
              child: Consumer<GoalsProvider>(
                child: const Center(
                  child: const Text(
                    'Empty',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                builder: (_, provider, child) {
                  final List<Activity> list = provider.getGoalsByDate();
                  return (list.length == 0)
                      ? child
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (_, i) {
                            return ActivityItemList(
                              activity: list[i],
                              onDismiss: provider.removeChecked,
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () => Navigator.pushNamed(context, AddGoalPage.routeName),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
