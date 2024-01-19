import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_list_item.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            child: ReportListItem(onTap: () async {
              // extra: model[index]
              await context.push(reportDetailPath);
            })
        );
      },
    );
  }
}
