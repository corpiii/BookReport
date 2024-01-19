import 'package:flutter/material.dart';

class ReportListItem extends StatelessWidget {
  final void Function() _onTap;

  const ReportListItem({
    super.key,
    required void Function() onTap,
  }): _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          width: double.infinity,
          height: 80,
        ),
      ),
    );
  }
}
