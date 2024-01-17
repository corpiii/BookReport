import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/home_view.dart';
import 'package:book_report/presentation/home_scene/widgets/bottom_tab_item.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _pageList = [
    const HomeView(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const spacerRatio = 1;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: _pageList[_selectedIndex]
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        surfaceTintColor: Colors.white,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(flex: spacerRatio,),
              BottomTabItem(icon: Icons.home, title: 'home', onTap: () {
                _selectedIndex = 0;
              }),
              const Spacer(flex: spacerRatio * 2,),
              BottomTabItem(icon: Icons.book, title: 'book', onTap: () {
                _selectedIndex = 1;
              }),
              const Spacer(flex: spacerRatio,),
            ],
          ),
        ),
      ),
    );
  }
}
