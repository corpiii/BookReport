import 'package:flutter/material.dart';

class BookReportHistory extends StatelessWidget {
  const BookReportHistory({super.key});

  @override
  Widget build(BuildContext context) {
    const sevenDays = 7;

    return SizedBox(
      height: 150,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: sevenDays,
          crossAxisSpacing: 2.0,
        ),
        itemCount: 365,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.greenAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
