import 'package:book_report/presentation/book_report_create_scene/widgets/app_bar_done_button.dart';
import 'package:book_report/presentation/book_report_create_scene/widgets/rounded_text_field.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReportCreateView extends StatefulWidget {
  const BookReportCreateView({super.key});

  @override
  State<BookReportCreateView> createState() => _BookReportCreateViewState();
}

class _BookReportCreateViewState extends State<BookReportCreateView> {
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleTextEditingController.dispose();
    _bodyTextEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBarDoneButton(onTap: () {
              // create model
              context.pop();
            }),
          )
        ],
        backgroundColor: ColorConstant.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RoundedTextField(
                controller: _titleTextEditingController,
                hintText: 'title',
                color: Colors.green,
                borderRadius: 12,
                maxLines: 1,
              ),
              SizedBox(height: 20,),
              RoundedTextField(
                controller: _bodyTextEditingController,
                hintText: 'body',
                color: Colors.green,
                maxLines: 15,
                borderRadius: 12,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,)
            ],
          ),
        ),
      ),
    );
  }
}
