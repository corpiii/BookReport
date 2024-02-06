import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/days_of_week_view.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/dismiss_button.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/time_picker_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NotificationSettingView extends ConsumerWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewProvider.notifier);
    final state = ref.watch(homeViewProvider);
    final dayList = [
      state.sundayTap,
      state.mondayTap,
      state.tuesdayTap,
      state.wednesdayTap,
      state.thursdayTap,
      state.fridayTap,
      state.saturdayTap,
    ];

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
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBarButton(
                'Clear',
                onTap: () async {
                  await viewModel.clearAlert();
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DaysOfWeekView(dayList: dayList),
              const SizedBox(height: 30),
              TimePickerView(
                hour: state.alertHour,
                minutes: state.alertMinutes,
              ),
            ],
          ),
        ));
  }
}
