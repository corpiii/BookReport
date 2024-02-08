import 'package:flutter/material.dart';

class RadiusBoxText extends StatelessWidget {
  final String text;
  final double _radius;
  final Color _color;
  final double _height;
  final bool _isCenterLeft;

  const RadiusBoxText(
    this.text, {
    super.key,
    required double radius,
    required Color color,
    required double height,
    bool? isCenterLeft,
  })  : _radius = radius,
        _color = color,
        _isCenterLeft = isCenterLeft ?? false,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: _color),
        borderRadius: BorderRadius.circular(_radius),
        // color: _color,
      ),
      width: double.infinity,
      height: _height,
      child: Align(
        alignment: _isCenterLeft ? Alignment.centerLeft : Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}
