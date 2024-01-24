import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  final void Function() _onLogout;
  final void Function() _onDeleteAccount;

  const DrawerView({super.key, required void Function() onLogout, required final void Function() onDeleteAccount})
      : _onLogout = onLogout,
        _onDeleteAccount = onDeleteAccount;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Log out'),
            onTap: _onLogout
          ),
          ListTile(
            title: Text(
              'Delete account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: _onDeleteAccount,
          ),
        ],
      ),
    );
  }
}
