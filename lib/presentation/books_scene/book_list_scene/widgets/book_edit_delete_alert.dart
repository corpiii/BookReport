import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/presentation/books_scene/book_list_scene/widgets/book_edit_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookEditDeleteAlert extends StatelessWidget {
  final Book _model;

  const BookEditDeleteAlert({super.key, required Book model}): _model = model;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: ListView(
          children: [
            ListTile(
              title: Text('edit'),
              onTap: () {
                context.pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return BookEditAlert();
                  },
                );
              },
            ),
            ListTile(
              title: Text(
                'delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () async {
                final viewModel = ProviderContainer().read(booksViewModelProvider.notifier);

                await viewModel.deleteBook(model: _model);
                viewModel.fetchBookList();
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
