import 'package:book_report/domain/model/book.dart';
import 'package:book_report/presentation/home_scene/widgets/latest_book_history/latest_book_item.dart';
import 'package:flutter/material.dart';

class LatestBookHistory extends StatelessWidget {
  final List<Book> _lastBooks;

  const LatestBookHistory({
    super.key,
    required List<Book> lastBooks,
  }) : _lastBooks = lastBooks;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _lastBooks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: LatestBookItem(_lastBooks[index]),
          );
        },
      ),
    );
  }
}
