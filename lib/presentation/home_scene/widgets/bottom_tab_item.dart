import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  IconData _icon;
  String _title;
  void Function() _onTap;

  BottomTabItem({
    super.key,
    required IconData icon,
    required String title,
    required void Function() onTap,
  })  : _icon = icon,
        _title = title,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Icon(_icon),
          Text(
            _title,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
