import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_goal_page.dart';
import '../providers/goals_provider.dart';
import '../models/activity.dart';
import '../pages/menu_page.dart';
import '../widgets/activity_litem_list.dart';
import '../widgets/bottom_sheet_calendar.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Color(0xffF4F6FD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, MenuPage.routeName),
          child: Hero(
            tag: 'icon-appbar-menu',
            child: Icon(
              Icons.menu,
              color: Colors.black54,
              size: 25,
            ),
          ),
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
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black54,
              size: 25,
            ),
            onPressed: () => _showModalBottomSheetCalendar(context),
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
            const SizedBox(
              height: 25.0,
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
