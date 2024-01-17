import 'package:flutter/material.dart';

class SessionTitle extends StatelessWidget {
  final String _title;

  const SessionTitle(String title, {super.key}) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Text(_title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
