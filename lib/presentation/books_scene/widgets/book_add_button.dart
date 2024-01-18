import 'package:flutter/material.dart';

class BookAddButton extends StatelessWidget {
  final void Function() _onTap;

  const BookAddButton({
    super.key,
    required void Function() onTap,
  }) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: Colors.deepPurple,
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}