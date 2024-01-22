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
    ref.read(homeViewProvider.notifier).fetchRandomAdvice();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RandomAdvice(),
        SizedBox(height: 20,),
        SessionTitle('최근 읽은 책'),
        SizedBox(height: 10,),
        LatestBookHistory(),
        SizedBox(height: 50,),
        NotificationInfo(onTap: () {
          context.go(notificationSettingPath);
        },),
      ],
    );
  }
}
