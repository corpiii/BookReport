import 'package:flutter/material.dart';

class DayOfWeekItem extends StatelessWidget {
  final void Function() _onTap;
  final String _text;
  final bool _isActive;

  const DayOfWeekItem({
    super.key,
    required String text,
    required bool isActive,
    required void Function() onTap,
  })  : _text = text,
        _isActive = isActive,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Text(
                _text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              _isActive
                  ? const Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    )
                  : Container(
                      height: 30,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
