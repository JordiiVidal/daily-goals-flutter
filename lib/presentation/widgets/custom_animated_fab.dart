import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class CustomAnimatedFAB extends StatefulWidget {
  CustomAnimatedFAB({Key key}) : super(key: key);

  @override
  CustomAnimatedFABState createState() => CustomAnimatedFABState();
}

class CustomAnimatedFABState extends State<CustomAnimatedFAB>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      herotag: 'btn-frm',
      backGroundColor: AppColors.accentColor,
      items: <Bubble>[
        Bubble(
          title: "Scheduled",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.calendar_today,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            Navigator.pushNamed(context, AppRoutes.scheduledForm);
          },
        ),
        Bubble(
          title: "Create",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.add,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            Navigator.pushNamed(context, AppRoutes.taskForm);
          },
        ),
      ],
      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: Colors.white,
      animatedIconData: AnimatedIcons.menu_close,
    );
  }
}
