import 'package:flutter/material.dart';

class NotificationInfo extends StatelessWidget {
  final void Function() _onTap;

  const NotificationInfo({
    super.key,
    required void Function() onTap,
  }) : _onTap = onTap;

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
        height: 100,
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
