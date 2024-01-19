import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/days_of_week_view.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/dismiss_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationSettingView extends StatelessWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DismissButton(onTap: () {
              context.pop();
            }),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              DaysOfWeekView(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
