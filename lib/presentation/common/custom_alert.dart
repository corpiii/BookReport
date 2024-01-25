import 'package:book_report/presentation/common/alert_action.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlert extends StatelessWidget {
  final String _headTitle;
  final List<AlertAction>? _actions;
  final Widget _child;

  const CustomAlert({
    super.key,
    String headTitle = 'Alert',
    List<AlertAction>? actions,
    required Widget child,
  })  : _headTitle = headTitle,
        _child = child,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                _headTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Expanded(child: Center(child: _child)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _actions ?? [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Center(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
