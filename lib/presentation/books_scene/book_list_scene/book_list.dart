import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/books_scene/book_list_scene/widgets/book_list_item.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookList extends ConsumerWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksViewModelProvider);

    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemCount: state.bookList.length,
          itemBuilder: (BuildContext context, int index) {
            final model = state.bookList[index];

            return BookListItem(
                model: model,
                onTap: () async {
                  final homeViewModel = ProviderContainer().read(homeViewProvider.notifier);
                  final bookReportListViewModel = ProviderContainer().read(bookReportListViewModelProvider.notifier);

                  homeViewModel.addLastBook(model);
                  bookReportListViewModel.bookModel = model;
                  await bookReportListViewModel.fetchBookReportList(onComplete: () {}, onError: (_) {});
                  context.push(bookReportListPath, extra: model);
                });
          }),
    );
  }
}
