import 'package:daily_goals/presentation/providers/category_provider.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                itemBuilder: (_, i) {
                  final category = categoryProvider.categoryList[i];
                  return ListTile(
                    leading: CircleIcon(
                      color: category.color,
                      iconData:
                          IconData(category.icon, fontFamily: 'MaterialIcons'),
                    ),
                    title: Text(category.name),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('0'),
                        Text(
                          'Tasks',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.formCategory),
        child: const Icon(Icons.add),
      ),
    );
  }
}
