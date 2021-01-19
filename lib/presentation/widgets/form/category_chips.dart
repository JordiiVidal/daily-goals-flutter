import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';

import 'package:chips_choice/chips_choice.dart';
import 'package:daily_goals/presentation/providers/goal_form_provider.dart';

import '../custom_chip.dart';

class CategoryChips extends StatelessWidget {
  final Function onChange;

  const CategoryChips(this.onChange);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ChipsChoice<String>.single(
            padding: const EdgeInsets.all(0),
            value: context.watch<GoalFormProvider>().categoryState,
            choiceBuilder: (item) {
              final int color =
                  context.read<CategoryProvider>().getColorById(item.value);
              return CustomChip(
                label: item.label,
                width: 90,
                height: 35,
                color: Color(color),
                selected: item.selected,
                onSelect: item.select,
              );
            },
            onChanged: (id) => onChange(context, id),
            choiceItems: C2Choice.listFrom<String, CategoryModel>(
              source: context.watch<CategoryProvider>().categoryList,
              value: (i, v) => v.id,
              label: (i, v) => v.name,
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
