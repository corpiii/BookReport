import 'package:book_report/presentation/books_scene/widgets/book_report_history.dart';
import 'package:book_report/presentation/books_scene/widgets/book_report_list.dart';
import 'package:book_report/presentation/books_scene/widgets/boot_report_add_button.dart';
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
          child: BookReportAddButton(onTap: () {
            // showDialog
            showDialog(context: context, builder: (context) {
              return CustomAlertDialog();
            });
          })
        ),
      ],
    );
  }
}
