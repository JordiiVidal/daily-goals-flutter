import 'package:daily_goals/domain/models/category_model.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color(categoryModel.color),
              ),
              child: Icon(
                IconData(categoryModel.icon, fontFamily: 'MaterialIcons'),
                color: Color(0XFFFFFFFF),
              ),
            ),
            SizedBox(width: 10),
            Text(categoryModel.name),
          ],
        ),
      ),
    );
  }
}
