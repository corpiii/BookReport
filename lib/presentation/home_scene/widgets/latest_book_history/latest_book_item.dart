import 'package:book_report/domain/model/book.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LatestBookItem extends StatelessWidget {
  final Book _item;

  const LatestBookItem(Book item, {super.key}) : _item = item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(bookReportListPath, extra: _item);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        width: 130,
        child: Center(
          child: Text(
            _item.title,
          ),
        ),
      ),
    );
  }
}
