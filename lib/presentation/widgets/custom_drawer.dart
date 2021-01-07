import 'dart:math';

import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: Drawer(
        child: Container(
          color: AppColors.secondaryColor,
          child: Stack(
            children: <Widget>[
              _backgroundDrawer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 120.0, horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Daily Goals',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryTextColor,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundDrawer() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -100,
          child: Container(
            height: 350,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250.0),
              ),
            ),
          ),
        ),
        Positioned(
          top: -80.0,
          left: -50.0,
          child: Transform.rotate(
            angle: -pi / 2.0,
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200.0),
                  bottomLeft: Radius.circular(200.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
