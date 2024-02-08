import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/presentation/books_scene/book_report_detail_scene/widgets/radius_box_text.dart';
import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportDetailView extends StatelessWidget {
  BookReport _model;

  BookReportDetailView({super.key, required BookReport model}) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppBarButton('Edit', onTap: () {
              context.push(reportEditPath, extra: _model);
            }),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            RadiusBoxText(
              _model.title,
              radius: 12.0,
              color: ColorConstant.tileColor,
              height: 60,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: RadiusBoxText(
                _model.content,
                radius: 12.0,
                color: ColorConstant.tileColor,
                height: 60,
              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
