import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/common/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportEditView extends StatefulWidget {
  const BookReportEditView({super.key});

  @override
  State<BookReportEditView> createState() => _BookReportEditViewState();
}

class _BookReportEditViewState extends State<BookReportEditView> {
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleTextEditingController.dispose();
    _bodyTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppBarButton(
              'Done',
              color: Colors.green,
              onTap: () {
                context.pop();
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RoundedTextField(
              controller: _titleTextEditingController,
              hintText: 'title',
              borderRadius: 12,
              maxLines: 1,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            RoundedTextField(
              controller: _bodyTextEditingController,
              hintText: 'body',
              borderRadius: 12,
              maxLines: 15,
              color: Colors.green,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
