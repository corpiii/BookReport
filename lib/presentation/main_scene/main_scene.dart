import 'package:book_report/presentation/books_scene/books_view.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/home_view.dart';
import 'package:book_report/presentation/home_scene/widgets/bottom_tab_item.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pageList = [
    const HomeView(),
    BooksView(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _pageList[_selectedIndex],
        )
      ),
      bottomNavigationBar: _bottomAppBar()
    );
  }

  BottomAppBar _bottomAppBar() {
    const spacerRatio = 1;

    return BottomAppBar(
      height: 65,
      surfaceTintColor: Colors.white,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(flex: spacerRatio),
            BottomTabItem(icon: Icons.home, title: 'home', onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            }),
            const Spacer(flex: spacerRatio * 2),
            BottomTabItem(icon: Icons.book, title: 'book', onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            }),
            const Spacer(flex: spacerRatio),
          ],
        ),
      ),
    );
  }
}
