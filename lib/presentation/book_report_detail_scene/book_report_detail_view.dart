import 'package:book_report/presentation/book_report_detail_scene/widgets/radius_box_text.dart';
import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportDetailView extends StatelessWidget {
  const BookReportDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBarButton('Edit', onTap: () async {
              await context.push(reportEditPath);
            }),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            RadiusBoxText(
              'fff',
              radius: 12.0,
              color: Colors.blue,
              height: 60,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: RadiusBoxText(
                'rrr',
                radius: 12.0,
                color: Colors.blue,
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
