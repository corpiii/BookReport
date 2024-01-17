import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.add,
          size: 20,
        ),
        Text(
          'data',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
