import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';
import 'package:daily_goals/presentation/widgets/goal_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
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
    final goalProvider = context.watch<GoalProvider>();
    return Scaffold(
      backgroundColor: Color(0xffF4F6FD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => null,
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
            child: Text(
              goalProvider.selectedDateText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black54,
              size: 22,
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
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: goalProvider.goalsDate.isNotEmpty
                  ? ListView.builder(
                      itemCount: goalProvider.goalsDate.length,
                      itemBuilder: (_, i) =>
                          GoalItemList(goal: goalProvider.goalsDate[i]),
                    )
                  : const Center(
                      child: Text(
                        'Empty',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.tasks),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
