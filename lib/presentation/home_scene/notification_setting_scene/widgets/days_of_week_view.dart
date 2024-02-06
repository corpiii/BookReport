import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/model/day.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/day_of_week_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DaysOfWeekView extends StatelessWidget {
  final List<bool> _dayList;

  const DaysOfWeekView({
    super.key,
    required List<bool> dayList,
  }) : _dayList = dayList;

  @override
  Widget build(BuildContext context) {
    final viewModel = ProviderContainer().read(homeViewProvider.notifier);

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DayOfWeekItem(
                text: 'Every Sunday',
                isActive: _dayList[0],
                onTap: () {
                  viewModel.switchDayActive(Day.sunday);
                },
              ),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                  text: 'Every Monday',
                  isActive: _dayList[1],
                  onTap: () {
                    viewModel.switchDayActive(Day.monday);
                  }),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                text: 'Every Tuesday',
                isActive: _dayList[2],
                onTap: () {
                  viewModel.switchDayActive(Day.tuesday);
                },
              ),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                text: 'Every Wednesday',
                isActive: _dayList[3],
                onTap: () {
                  viewModel.switchDayActive(Day.wednesday);
                },
              ),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                text: 'Every Thursday',
                isActive: _dayList[4],
                onTap: () {
                  viewModel.switchDayActive(Day.thursday);
                },
              ),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                text: 'Every Friday',
                isActive: _dayList[5],
                onTap: () {
                  viewModel.switchDayActive(Day.friday);
                },
              ),
              Container(width: double.infinity, color: Colors.grey, height: 0.5),
              DayOfWeekItem(
                text: 'Every Saturday',
                isActive: _dayList[6],
                onTap: () {
                  viewModel.switchDayActive(Day.saturday);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
