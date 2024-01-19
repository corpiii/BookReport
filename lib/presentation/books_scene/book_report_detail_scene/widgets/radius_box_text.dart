import 'package:flutter/material.dart';

class RadiusBoxText extends StatelessWidget {
  final String text;
  final double _radius;
  final Color _color;
  final double _height;

  const RadiusBoxText(
    this.text, {
    super.key,
    required double radius,
    required Color color,
    required double height,
  })  : _radius = radius,
        _color = color,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        color: _color,
      ),
      width: double.infinity,
      height: _height,
      child: Text(text),
    );
  }
}
