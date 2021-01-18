import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../theme.dart';
import '../circle_icon.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;
  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        GestureDetector(
          onTap: () =>
              context.read<CategoryProvider>().delteCategory(category.id),
          child: Container(
            margin: const EdgeInsets.only(
              top: 3.0,
              bottom: 3.0,
              left: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: Center(child: const Text('Delete')),
          ),
        ),
      ],
      child: ListTile(
        leading: CircleIcon(
          color: category.color,
          iconData: IconData(category.icon, fontFamily: 'MaterialIcons'),
        ),
        title: Text(category.name),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${category.total}'),
            Text(
              'Tasks',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
