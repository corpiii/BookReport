import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/home_scene/widgets/latest_book_history/latest_book_history.dart';
import 'package:book_report/presentation/home_scene/widgets/notification_info.dart';
import 'package:book_report/presentation/home_scene/widgets/random_advice.dart';
import 'package:book_report/presentation/home_scene/widgets/session_title.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewProvider);
    final viewModel = ref.read(homeViewProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RandomAdvice(
          comment: state.randomAdvice,
          onTap: () {
            viewModel.fetchRandomAdvice();
          },
        ),
        const SizedBox(height: 20),
        const SessionTitle('Last books'),
        const SizedBox(height: 10),
        LatestBookHistory(),
        const SizedBox(height: 50),
        const SessionTitle('Read Notification'),
        const SizedBox(height: 10),
        NotificationInfo(
          comment: state.notificationComment,
          onTap: () {
            context.go(notificationSettingPath);
          },
        ),
      ],
    );
  }
}
