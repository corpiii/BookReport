import 'package:book_report/presentation/books_scene/book_list_scene/widgets/book_edit_delete_alert.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListItem extends StatelessWidget {
  final void Function() _onTap; // need model argument

  const BookListItem({
    super.key,
    required void Function() onTap,
  }) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return BookEditDeleteAlert();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.blue,
        ),
      ),
    );
  }
}