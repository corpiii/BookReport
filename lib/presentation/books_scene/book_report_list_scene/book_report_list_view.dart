import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_add_button.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_list.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportListView extends StatefulWidget {
  const BookReportListView({super.key});

  @override
  State<BookReportListView> createState() => _BookReportListViewState();
}

class _BookReportListViewState extends State<BookReportListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        title: Text('Book Title'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ReportList(),
                Positioned(
                  child: ReportAddButton(onTap: () {
                    context.push(reportCreatePath);
                  }),
                  right: 20,
                  bottom: 20,
                ),
              ],
            )),
      ),
    );
  }
}
