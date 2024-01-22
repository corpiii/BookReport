import 'package:book_report/di/view_model_provider/home_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomAdvice extends ConsumerWidget {
  const RandomAdvice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewProvider);

    return GestureDetector(
      onTap: () {
        ref.read(homeViewProvider.notifier).fetchRandomAdvice();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 150,
        child: Center(
          child: Text(
            state.randomAdvice,
          ),
        ),
      ),
    );
  }
}
