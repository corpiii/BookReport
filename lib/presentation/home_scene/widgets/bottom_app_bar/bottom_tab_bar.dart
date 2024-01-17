import 'package:book_report/presentation/home_scene/widgets/bottom_app_bar/bottom_tab_item.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      surfaceTintColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomTabItem(),
          BottomTabItem(),
        ],
      ),
    );
  }
}
