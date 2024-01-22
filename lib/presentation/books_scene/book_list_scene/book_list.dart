import 'package:book_report/presentation/books_scene/book_list_scene/widgets/book_list_item.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return BookListItem(onTap: () { // need model
            context.push(bookReportListPath);
          });
      }),
    );
  }
}