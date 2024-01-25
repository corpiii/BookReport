import 'package:book_report/presentation/common/alert_action.dart';
import 'package:book_report/presentation/common/custom_alert.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuestLoginView extends StatelessWidget {
  const GuestLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t you have any Account? ',
            style: TextStyle(color: Colors.black54),
          ),
          GestureDetector(
            onTap: () {
              _showDialog(context);
            },
            child: const Text(
              'Try Guest',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final doneAction = AlertAction(title: 'Start', isBold: true, onTap: () {
      context.go(mainPath);
    });

    showDialog(
      context: context,
      builder: (context) {
        return CustomAlert(
          child: Text('Nothing is saved in guest mode.'),
          actions: [doneAction],
        );
      }
    );
  }
}
