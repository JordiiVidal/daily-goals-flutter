import 'package:daily_goals/config/data.dart';
import 'package:daily_goals/widgets/circle_menu_item.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menu';
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'icon-appbar-menu',
            child: Icon(
              Icons.close,
              color: Colors.black54,
              size: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Menu',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Move around app',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 0,
                ),
                itemCount: 6,
                itemBuilder: (_, i) => CircleMenuItem(menuItems[i]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
