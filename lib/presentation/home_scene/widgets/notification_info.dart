import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';

class NotificationInfo extends StatelessWidget {
  final void Function() _onTap;
  final String _comment;

  const NotificationInfo({
    super.key,
    required String comment,
    required void Function() onTap,
  })  : _onTap = onTap,
        _comment = comment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstant.greyColor,
        ),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Center(
          child: Text(_comment),
        ),
      ),
    );
  }
}
