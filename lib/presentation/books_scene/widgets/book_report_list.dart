import 'package:book_report/presentation/books_scene/widgets/book_report_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportList extends StatelessWidget {
  const BookReportList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return BookReportItem(onTap: () { // need model
            context.push('detail');
          },);
      }),
    );
  }
}
