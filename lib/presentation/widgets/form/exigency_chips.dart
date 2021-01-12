import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chips_choice/chips_choice.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/form_provider.dart';

import '../../theme.dart';
import '../custom_chip.dart';

class ExigencyChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Exigency',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ChipsChoice<int>.single(
            padding: const EdgeInsets.all(0),
            value: context.watch<FormProvider>().exigencyState,
            choiceBuilder: (item) {
              return CustomChip(
                label: item.label,
                width: 90,
                height: 35,
                color: AppColors.accentColor,
                selected: item.selected,
                onSelect: item.select,
              );
            },
            onChanged: (i) => context.read<FormProvider>().setExigency(i),
            choiceItems: C2Choice.listFrom<int, Exigency>(
              source: context.watch<FormProvider>().chipsItems,
              value: (i, v) => v.index,
              label: (i, v) => exigencyToString(v),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
