import 'package:book_report/di/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationInfo extends StatelessWidget {
  final void Function() _onTap;
  final String _comment;

  const NotificationInfo({
    super.key,
    required String comment,
    required void Function() onTap,
  })  : _onTap = onTap,
        _comment = comment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Center(
          child: Text(_comment),
        ),
      ),
    );
  }
}
