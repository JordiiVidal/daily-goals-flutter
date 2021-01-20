import 'package:daily_goals/presentation/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/category/category_tile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: AppPadding.screen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPadding.title,
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryProvider.categoryList.length,
                    itemBuilder: (_, i) =>
                        CategoryTile(categoryProvider.categoryList[i]),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 18,
            right: 60,
            left: 60,
            child: Hero(
              tag: 'btn-frm-ctg',
              child: ButtonIcon(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.categoryForm),
                title: 'Category',
                icon: Icons.add,
              ),
            ),
          )
        ],
      ),
    );
  }
}
