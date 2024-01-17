import 'package:book_report/presentation/home_scene/widgets/latest_book_history/latest_book_item.dart';
import 'package:flutter/material.dart';

class LatestBookHistory extends StatelessWidget {
  const LatestBookHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: LatestBookItem(),
          );
        },
      ),
    );
  }
}
