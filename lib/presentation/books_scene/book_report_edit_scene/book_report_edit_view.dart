import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/presentation/common/app_bar_button.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/common/rounded_text_field.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookReportEditView extends StatefulWidget {
  final BookReport _model;

  const BookReportEditView({super.key, required BookReport model}) : _model = model;

  @override
  State<BookReportEditView> createState() => _BookReportEditViewState();
}

class _BookReportEditViewState extends State<BookReportEditView> {
  late final TextEditingController _titleTextEditingController;
  late final TextEditingController _bodyTextEditingController;

  @override
  void dispose() {
    super.dispose();
    _titleTextEditingController.dispose();
    _bodyTextEditingController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _titleTextEditingController = TextEditingController(text: widget._model.title);
    _bodyTextEditingController = TextEditingController(text: widget._model.content);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ProviderContainer().read(bookReportListViewModelProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                  final editedModel = widget._model.copyWith(
                    title: _titleTextEditingController.text,
                    content: _bodyTextEditingController.text,
                  );

                  viewModel.editBookReport(
                    bookReport: editedModel,
                    onComplete: () async {
                      await viewModel.fetchBookReportList(
                          onComplete: () {
                            context.pop();
                            context.replace(reportDetailPath, extra: editedModel);
                          },
                          onError: (_) {});
                    },
                    onError: (_) {},
                  );
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                  hintText: 'content',
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
        ),
      ),
    );
  }
}
