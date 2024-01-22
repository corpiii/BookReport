import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/rounded_text_field.dart';

class BookEditAlert extends StatefulWidget {
  const BookEditAlert({super.key});

  @override
  State<BookEditAlert> createState() => _BookEditAlertState();
}

class _BookEditAlertState extends State<BookEditAlert> {
  final TextEditingController _textEditingController = TextEditingController();

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
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
