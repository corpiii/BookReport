import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/books_scene/books_view.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/home_view.dart';
import 'package:book_report/presentation/home_scene/widgets/bottom_tab_item.dart';
import 'package:book_report/presentation/main_scene/common/pages.dart';
import 'package:book_report/presentation/main_scene/drawer_scene/drawer_view.dart';
import 'package:book_report/presentation/main_scene/main_view_model.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainView extends ConsumerWidget {
  MainView({super.key});

  final List<Widget> _pageList = [
    const HomeView(),
    BooksView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainViewModelProvider);
    final viewModel = ref.read(mainViewModelProvider.notifier);

    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.backgroundColor,
        ),
        drawer: DrawerView(
          onLogout: () {
            viewModel.logout(completion: () {
              print('complete logout?');
              context.go(loginPath);
            });
          },
          onDeleteAccount: () {
            _showDialog(context, 'Delete Account', onDelete: () {
              viewModel.deleteAccount(onComplete: () {
                print('complete delete?');
                context.go(loginPath);
              });
            });
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _pageList[state.selectedIndex],
          ),
        ),
        bottomNavigationBar: _bottomAppBar(viewModel, state.selectedIndex));
  }

  BottomAppBar _bottomAppBar(MainViewModel viewModel, int selectedIndex) {
    const spacerRatio = 1;

    return BottomAppBar(
      height: 65,
      surfaceTintColor: Colors.white,
      color: ColorConstant.backgroundColor,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(flex: spacerRatio),
            BottomTabItem(
                icon: Icons.home,
                title: 'home',
                color: selectedIndex != 0 ? Colors.black : ColorConstant.deepTileColor,
                onTap: () {
                  viewModel.transitionPage(Pages.home);
                }),
            const Spacer(flex: spacerRatio * 2),
            BottomTabItem(
              icon: Icons.book,
              title: 'books',
              color: selectedIndex != 1 ? Colors.black : ColorConstant.deepTileColor,
              onTap: () {
                viewModel.transitionPage(Pages.book);
              },
            ),
            const Spacer(flex: spacerRatio),
          ],
        ),
      ),
    );
  }

  void _showDialog(
    BuildContext context,
    String title, {
    required void Function() onDelete,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: onDelete,
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
