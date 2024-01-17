import 'package:book_report/presentation/books_scene/widgets/book_report_history.dart';
import 'package:book_report/presentation/books_scene/widgets/book_report_list.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookReportHistory(),
        SizedBox(height: 20),
        Expanded(
          child: BookReportList(),
        ),
      ],
    );
  }
}
