import 'package:flutter/material.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Center(
        child: Text(''),
      ),
    );
  }
}
