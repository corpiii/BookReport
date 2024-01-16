import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/image/logo.png',
          height: width * 0.4,
          width: width * 0.4,
        ),
      ),
    );
  }
}
