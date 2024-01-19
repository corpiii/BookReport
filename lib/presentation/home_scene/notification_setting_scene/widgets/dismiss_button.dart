import 'package:flutter/material.dart';

class DismissButton extends StatelessWidget {
  final void Function() _onTap;

  const DismissButton({
    super.key,
    required void Function() onTap,
  }) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Icon(
        Icons.close,
        size: 30,
      ),
    );
  }
}
