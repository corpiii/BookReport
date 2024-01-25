import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateBookAlertDialog extends StatefulWidget {
  const CreateBookAlertDialog({super.key});

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
        TextButton(onPressed: () {
          context.pop();
        }, child: Text('cancel')),
        TextButton(onPressed: () {
            // todo createBook
        }, child: Text('done')),
      ],
    );
  }
}
