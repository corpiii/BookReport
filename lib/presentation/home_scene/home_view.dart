import 'package:book_report/presentation/home_scene/widgets/latest_book_history/latest_book_history.dart';
import 'package:book_report/presentation/home_scene/widgets/notification_info.dart';
import 'package:book_report/presentation/home_scene/widgets/random_advice.dart';
import 'package:book_report/presentation/home_scene/widgets/session_title.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RandomAdvice(),
        SizedBox(height: 20,),
        SessionTitle('Last books'),
        SizedBox(height: 10,),
        LatestBookHistory(),
        SizedBox(height: 50,),
        SessionTitle('Read Notification'),
        SizedBox(height: 10,),
        NotificationInfo(onTap: () {
          context.go(notificationSettingPath);
        },),
      ],
    );
  }
}
