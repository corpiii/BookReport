import 'package:flutter/material.dart';

class RandomAdvice extends StatelessWidget {
  const RandomAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
    );
  }
}
