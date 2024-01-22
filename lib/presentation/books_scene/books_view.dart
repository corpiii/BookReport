import 'package:book_report/presentation/books_scene/widgets/latest_book_history.dart';
import 'package:book_report/presentation/books_scene/book_list_scene/book_list.dart';
import 'package:book_report/presentation/books_scene/widgets/book_add_button.dart';
import 'package:book_report/presentation/books_scene/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksView extends StatefulWidget {
  BooksView({super.key});

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [
            LatestBookHistory(),
            SizedBox(height: 20),
            Expanded(
              child: BookList(),
            ),
          ],
        ),
        Positioned(right: 10, bottom: 10, child: BookAddButton(onTap: () {
          showDialog(context: context, builder: (context) => CustomAlertDialog());
        })),
      ],
    );
  }
}
