import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final void Function() _onTap;
  final String _text;
  final Color _color;

  const AppBarButton(
    String text, {
    super.key,
    Color color = ColorConstant.deepTileColor,
    required void Function() onTap,
  })  : _text = text,
        _color = color,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Text(
        _text,
        style: TextStyle(
          color: _color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
