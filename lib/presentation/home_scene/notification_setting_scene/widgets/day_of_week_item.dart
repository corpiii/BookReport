import 'package:flutter/material.dart';

class DayOfWeekItem extends StatelessWidget {
  final void Function() _onTap;
  final String _text;

  const DayOfWeekItem({
    super.key,
    required String text,
    required void Function() onTap,
  })  : _text = text,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) {}, // color Change
      onTapUp: (detail) {},
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text(_text),
            const Spacer(),
            const Icon(Icons.check, color: Colors.greenAccent,),
          ],
        ),
      ),
    );
  }
}
