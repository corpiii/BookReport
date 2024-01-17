import 'package:flutter/material.dart';

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
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.blue,
          )),
    );
  }
}
