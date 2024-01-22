import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text('Log out'), onTap: () {
            context.go('/');
          },),
          ListTile(title: Text('Delete account', style: TextStyle(color: Colors.red),), onTap: () {},),
        ],
      ),
    );
  }
}
