import 'package:flutter/material.dart';

class LatestBookItem extends StatelessWidget {
  const LatestBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue
      ),
      width: 130,
    );
  }
}
