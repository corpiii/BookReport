import 'package:book_report/presentation/home_scene/notification_setting_scene/widgets/day_of_week_item.dart';
import 'package:flutter/material.dart';

class DaysOfWeekView extends StatelessWidget {
  const DaysOfWeekView({super.key});

  @override
  Widget build(BuildContext context) {
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
              DayOfWeekItem(text: '일요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '월요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '화요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '수요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '목요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '금요일마다', onTap: () {}),
              Container(width: double.infinity, color: Colors.grey, height: 0.5,),
              DayOfWeekItem(text: '토요일마다', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
