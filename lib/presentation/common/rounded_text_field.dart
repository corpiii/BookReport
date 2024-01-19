import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  final Color _color;
  final double _borderRadius;
  final int? _maxLines;

  const RoundedTextField({
    super.key,
    required TextEditingController controller,
    String hintText = '',
    Color color = Colors.black,
    double? borderRadius,
    int? maxLines,
  })  : _textEditingController = controller,
        _hintText = hintText,
        _color = color,
        _borderRadius = borderRadius ?? 0,
        _maxLines = maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: _maxLines,
      maxLines: _maxLines,
      cursorColor: _color,
      decoration: InputDecoration(
        hintText: _hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _color),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _color),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
      controller: _textEditingController,
    );
  }
}
