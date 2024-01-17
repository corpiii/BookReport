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
    // TODO: implement dispose
    super.dispose();
    _textEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('추가'),
      content: TextField(
        controller: _textEditController,
        decoration: const InputDecoration(
          hintText: '책 제목',
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          context.pop();
        }, child: Text('취소')),
        TextButton(onPressed: () {

        }, child: Text('등록')),
      ],
    );
  }
}
