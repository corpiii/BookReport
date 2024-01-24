import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
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
