import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/widgets/report_list_item.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReportList extends ConsumerWidget {
  const ReportList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(bookReportListViewModelProvider.notifier);
    final state = ref.watch(bookReportListViewModelProvider);
    final reportList = state.bookReportList;

    return ListView.builder(
      itemCount: reportList.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: Key('$index'),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // viewModel.deleteReport(reportList[index]);
            },
            child: ReportListItem(
                model: reportList[index],
                onTap: () async {
                  await context.push(reportDetailPath, extra: reportList[index]);
                }));
      },
    );
  }
}
