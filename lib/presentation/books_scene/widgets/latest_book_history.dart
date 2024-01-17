import 'package:flutter/material.dart';

class LatestBookHistory extends StatelessWidget {
  const LatestBookHistory({super.key});

  @override
  Widget build(BuildContext context) {
    const sevenDays = 7;

    return SizedBox(
      height: 150,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: sevenDays,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
        ),
        itemCount: 365,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.greenAccent,
            ),
          );
        },
      ),
    );
  }
}
