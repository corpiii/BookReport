import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/rounded_text_field.dart';

class BookEditAlert extends StatefulWidget {
  final Book _model;

  const BookEditAlert({
    super.key,
    required Book model,
  }) : _model = model;

  @override
  State<BookEditAlert> createState() => _BookEditAlertState();
}

class _BookEditAlertState extends State<BookEditAlert> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = widget._model.title;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: RoundedTextField(
        controller: _textEditingController,
        color: Colors.deepPurple,
        borderRadius: 12.0,
        maxLines: 1,
      ),
      actions: [
        TextButton(
          child: Text('cancel'),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          child: Text('done'),
          onPressed: () async {
            final viewModel = ProviderContainer().read(booksViewModelProvider.notifier);
            final newTitle = _textEditingController.text;

            if (newTitle.isNotEmpty) {
              await viewModel.editBook(
                model: widget._model,
                updatedTitle: newTitle,
              );
              viewModel.fetchBookList();

              context.pop();
            }
          },
        ),
      ],
    );
  }
}
