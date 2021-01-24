import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/main_providert.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

class TaskSelect extends StatelessWidget {
  const TaskSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
      modalConfig: S2ModalConfig(
        headerStyle: S2ModalHeaderStyle(
          backgroundColor: AppColors.secondaryColor,
          iconTheme: IconThemeData(
            color: AppColors.primaryTextColor,
          ),
          textStyle: TextStyle(
            color: AppColors.primaryTextColor,
          ),
          actionsIconTheme: IconThemeData(
            color: AppColors.primaryTextColor,
          ),
        ),
      ),
      title: 'Task',
      placeholder: 'Choose one',
      value: '',
      onChange: (state) => print(state),
      choiceItems: S2Choice.listFrom<String, TaskModel>(
        source: context.watch<MainProvider>().tasksList,
        value: (index, item) => item.id,
        title: (index, item) => item.name,
      ),
      choiceConfig: S2ChoiceConfig(
        style: S2ChoiceStyle(
          color: AppColors.primaryColor,
          activeColor: AppColors.accentColor,
          titleStyle: TextStyle(color: AppColors.primaryTextColor),
        ),
      ),
      modalFilter: true,
      modalFilterAuto: true,
      tileBuilder: (context, state) => S2Tile.fromState(
        state,
        isTwoLine: true,
        padding: AppPadding.formH,
      ),
    );
  }
}
