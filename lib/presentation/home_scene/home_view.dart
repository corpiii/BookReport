import 'package:book_report/presentation/home_scene/widgets/latest_book_history/latest_book_history.dart';
import 'package:book_report/presentation/home_scene/widgets/notification_setting.dart';
import 'package:book_report/presentation/home_scene/widgets/random_advice.dart';
import 'package:book_report/presentation/home_scene/widgets/session_title.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RandomAdvice(),
          SizedBox(height: 20,),
          SessionTitle('최근 읽은 책'),
          SizedBox(height: 10,),
          LatestBookHistory(),
          SizedBox(height: 50,),
          NotificationSetting(),
        ],
      ),
    );
  }
}
