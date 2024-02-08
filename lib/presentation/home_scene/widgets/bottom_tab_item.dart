import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  IconData _icon;
  String _title;
  final Color _color;

  void Function() _onTap;

  BottomTabItem({
    super.key,
    required IconData icon,
    required String title,
    required Color color,
    required void Function() onTap,
  })  : _icon = icon,
        _title = title,
        _color = color,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Icon(
            _icon,
            color: _color,
          ),
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
