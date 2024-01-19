import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerView extends StatelessWidget {
  const TimePickerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              itemExtent: 30,
              onSelectedItemChanged: (value) {},
              looping: true,
              children: List.generate(24,(index) => Text('$index')),
            ),
          ),
          const Text(':', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {},
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
