import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryPorivder = context.watch<CategoryProvider>();

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.categories),
              ),
            ],
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryPorivder.categoryList.length,
              itemBuilder: (_, i) =>
                  CategoryCard(categoryPorivder.categoryList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
