import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_add_button.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_list.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportListView extends StatelessWidget {
  final String _title;

  const BookReportListView({
    super.key,
    required String title,
  })  : _title = title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        title: Text(_title),
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
