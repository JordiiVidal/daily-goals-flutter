import 'package:daily_goals/presentation/providers/task_details_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();

    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(),
      child: AnimatedCircularChart(
        key: _chartKey,
        size: const Size(180.0, 180.0),
        initialChartData: context.watch<TaskDetailsProvider>().data,
        duration: Duration(milliseconds: 400),
        chartType: CircularChartType.Radial,
        percentageValues: true,
        holeRadius: 50,
        holeLabel: context.watch<TaskDetailsProvider>().holeLabel,
        labelStyle: new TextStyle(
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
