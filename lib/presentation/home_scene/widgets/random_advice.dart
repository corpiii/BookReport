import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomAdvice extends StatelessWidget {
  const RandomAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Center(child: Text('feawf')),
      );
    });
  }
}
