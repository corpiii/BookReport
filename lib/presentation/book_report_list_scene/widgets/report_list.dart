import 'package:flutter/material.dart';

class ReportList extends StatelessWidget {
  const ReportList({super.key});

  // final modelList; // need model List

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key('$index'),
          background: Container(color: Colors.red,),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: 80,
            ),
          ),
        );
      },
    );
  }
}
