import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportListItem extends StatelessWidget {
  final void Function() _onTap;
  final BookReport _model;

  const ReportListItem({
    super.key,
    required BookReport model,
    required void Function() onTap,
  })  : _model = model,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.tileColor,
            borderRadius: BorderRadius.circular(12),
          ),
          width: double.infinity,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  _model.title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(DateFormat('yyyy-MM-dd').format(_model.dateTime)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
