import 'package:book_report/presentation/home_scene/widgets/random_advice.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FAF4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RandomAdvice(),
              SizedBox(height: 12.0,),
            ],
          ),
        ),
      ),
    );
  }
}
