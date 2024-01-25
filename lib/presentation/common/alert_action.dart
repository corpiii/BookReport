import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertAction extends StatelessWidget {
  final void Function() _onTap;
  final String _title;
  final bool _isBold;
  final Color _color;

  const AlertAction({
    super.key,
    bool isBold = false,
    Color color = Colors.blue,
    required String title,
    required void Function() onTap,
  })  : _onTap = onTap,
        _title = title,
        _isBold = isBold,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        _onTap();
      },
      child: Center(
        child: Text(
          _title,
          style: TextStyle(
            color: _color,
            fontWeight: _isBold == true ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
