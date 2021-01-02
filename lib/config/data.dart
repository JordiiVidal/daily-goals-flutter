import 'package:daily_goals/pages/activity_list_page.dart';
import 'package:daily_goals/pages/add_activity_page.dart';
import 'package:daily_goals/pages/add_goal_page.dart';
import 'package:flutter/material.dart';

import '../models/menu.dart';
import 'package:daily_goals/pages/home_page.dart';

const List<MenuItem> menuItems = [
  MenuItem(Icons.home, 'Home', '', HomePage.routeName),
  MenuItem(Icons.dashboard, 'Tasks', '', ActivityListPage.routeName),
  MenuItem(Icons.playlist_add_check, 'New Task', '', AddActivityPage.routeName),
  MenuItem(Icons.bookmark, 'Categories', '', ''),
  MenuItem(Icons.person, 'Profile', '', ''),
  MenuItem(Icons.settings, 'Settings', '', ''),
];
