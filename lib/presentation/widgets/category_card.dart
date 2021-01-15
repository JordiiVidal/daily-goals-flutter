import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/circle_icon.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => null,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 140,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: CircleIcon(
                  iconData:
                      IconData(categoryModel.icon, fontFamily: 'MaterialIcons'),
                  color: categoryModel.color,
                ),
              ),
              SizedBox(width: 10),
              Text(categoryModel.name),
            ],
          ),
        ),
      ),
    );
  }
}
