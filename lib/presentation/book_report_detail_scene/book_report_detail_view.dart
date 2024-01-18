import 'package:book_report/presentation/book_report_detail_scene/widgets/radius_box_text.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';

class BookReportDetailView extends StatelessWidget {
  const BookReportDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
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
