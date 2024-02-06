import 'package:book_report/di/view_model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimePickerView extends StatefulWidget {
  final int _hour;
  final int _minutes;

  const TimePickerView({
    super.key,
    required int hour,
    required int minutes,
  })  : _hour = hour,
        _minutes = minutes;

  @override
  State<TimePickerView> createState() => _TimePickerViewState();
}

class _TimePickerViewState extends State<TimePickerView> {
  late final FixedExtentScrollController _hourController;
  late final FixedExtentScrollController _minutesController;

  @override
  void initState() {
    super.initState();
    _hourController = FixedExtentScrollController(initialItem: widget._hour);
    _minutesController = FixedExtentScrollController(initialItem: widget._minutes);

    final viewModel = ProviderContainer().read(homeViewProvider.notifier);
    viewModel.clearDelegate = () {
      _hourController.jumpToItem(0);
      _minutesController.jumpToItem(0);
    };
  }

  @override
  void dispose() {
    super.dispose();
    _hourController.dispose();
    _minutesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ProviderContainer().read(homeViewProvider.notifier);

    return Container(
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              scrollController: _hourController,
              itemExtent: 30,
              onSelectedItemChanged: (value) async {
                await viewModel.setHour(value);
              },
              looping: true,
              children: List.generate(24, (index) => Text('$index')),
            ),
          ),
          const Text(':',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              scrollController: _minutesController,
              itemExtent: 30,
              onSelectedItemChanged: (value) async {
                await viewModel.setMinutes(value);
              },
              looping: true,
              children: List.generate(60, (index) => Text('$index'.padLeft(2, '0'))),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
