// import 'package:daily_goals/config/data.dart';
// import 'package:flutter/material.dart';

// import '../models/menu.dart';

// class CircleMenuItem extends StatelessWidget {
//   final MenuItem menuItem;
//   const CircleMenuItem(this.menuItem);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () => Navigator.pushNamed(context, menuItem.routeName),//TODO FIX NAVIGATION
//           child: CircleAvatar(
//             backgroundColor: Colors.grey[300],
//             radius: 40,
//             child: Center(
//               child: Icon(
//                 menuItem.icon,
//                 size: 30,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(menuItem.title)
//       ],
//     );
//   }
// }
