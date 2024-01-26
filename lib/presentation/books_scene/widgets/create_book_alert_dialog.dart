import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/books_scene/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateBookAlertDialog extends StatefulWidget {
  const CreateBookAlertDialog({
    super.key,
  });

  @override
  State<CreateBookAlertDialog> createState() => _CreateBookAlertDialogState();
}

class _CreateBookAlertDialogState extends State<CreateBookAlertDialog> {
  final _textEditController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add new Book'),
      content: TextField(
        controller: _textEditController,
        decoration: const InputDecoration(
          hintText: 'Book title',
        ),
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
            final title = _textEditController.text;
            final viewModel = ProviderContainer().read(booksViewModelProvider.notifier);

            if (title.isNotEmpty) {
              await viewModel.createBook(title: title);
              await viewModel.fetchBookList();
              context.pop();
            }
          },
        ),
      ],
    );
  }
}
