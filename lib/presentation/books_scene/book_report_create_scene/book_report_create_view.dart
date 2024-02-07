import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_model.dart';
import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/rounded_text_field.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
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
    super.dispose();
    _titleTextEditingController.dispose();
    _bodyTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBarButton(
                'Done',
                color: Colors.green,
                onTap: () {
                  final viewModel = ProviderContainer().read(bookReportListViewModelProvider.notifier);

                  viewModel.createBookReport(
                    title: _titleTextEditingController.text,
                    content: _bodyTextEditingController.text,
                    onComplete: () async {
                      await viewModel.fetchBookReportList(onComplete: () {}, onError: (_) {});
                      context.pop();
                    },
                    onError: (error) {},
                  );
                },
              ),
            )
          ],
          backgroundColor: ColorConstant.backgroundColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
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
                  const SizedBox(height: 20),
                  RoundedTextField(
                    controller: _bodyTextEditingController,
                    hintText: 'body',
                    color: Colors.green,
                    maxLines: 15,
                    borderRadius: 12,
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
