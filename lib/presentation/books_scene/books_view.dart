import 'package:book_report/presentation/books_scene/widgets/book_report_history.dart';
import 'package:book_report/presentation/books_scene/widgets/book_report_list.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [
            BookReportHistory(),
            SizedBox(height: 20),
            Expanded(
              child: BookReportList(),
            ),
          ],
        ),

        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.deepPurple,
            ),
            width: 50,
            height: 50,
          )
        ),
      ],
    );
  }
}
