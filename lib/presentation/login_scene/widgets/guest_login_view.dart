import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/presentation/common/alert_action.dart';
import 'package:book_report/presentation/common/custom_alert.dart';
import 'package:book_report/presentation/login_scene/login_view_model.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GuestLoginView extends ConsumerWidget {
  const GuestLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginViewModelProvider.notifier);

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
              _showDialog(context, viewModel);
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

  void _showDialog(BuildContext context, LoginViewModel viewModel) {
    final doneAction = AlertAction(title: 'Start', isBold: true, onTap: () {
      viewModel.login(method: OAuthMethod.anonymous, onComplete: () {
        context.go(mainPath);
      }, onError: (_) {});
    });

    showDialog(
      context: context,
      builder: (context) {
        return CustomAlert(
          child: Text('Guest will remove after 30 Days.'),
          actions: [doneAction],
        );
      }
    );
  }
}
