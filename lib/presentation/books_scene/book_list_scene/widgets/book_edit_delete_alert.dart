import 'package:book_report/presentation/books_scene/book_list_scene/widgets/book_edit_alert.dart';
import 'package:book_report/presentation/common/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookEditDeleteAlert extends StatefulWidget {
  const BookEditDeleteAlert({super.key});

  @override
  State<BookEditDeleteAlert> createState() => _BookEditDeleteAlertState();
}

class _BookEditDeleteAlertState extends State<BookEditDeleteAlert> {
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
