import 'package:flutter/material.dart';

class AppBarDoneButton extends StatelessWidget {
  final void Function() _onTap;

  const AppBarDoneButton({
    super.key,
    required void Function() onTap,
  }) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: const Text(
        'Done',
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
