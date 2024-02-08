import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomAdvice extends StatelessWidget {
  final String _comment;
  final void Function() _onTap;

  const RandomAdvice({super.key, required String comment, required void Function() onTap})
      : _comment = comment,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstant.tileColor,
          ),
          height: 145,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                _comment,
                style: TextStyle(
                  fontFamily: 'RubikScribble-Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
