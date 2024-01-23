import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/google_login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OAuthLoginView extends ConsumerWidget {
  const OAuthLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);

    return Column(
      children: [
        Container(
          color: Colors.black12,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loginIcon(
              'assets/image/google_sign_icon.png',
              onTap: () {
                final viewModel = ref.read(loginViewModelProvider.notifier);

                viewModel.oAuthLoginUseCase = GoogleLoginUseCase();
                viewModel.login();
              },
            ),
            const SizedBox(width: 30),
            _loginIcon(
              'assets/image/apple_sign_icon.png',
              onTap: () {},
            ),
            const SizedBox(width: 30),
            _loginIcon(
              'assets/image/logo.png',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _loginIcon(String imageUrl, {required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Image.asset(
          imageUrl,
          // color: _isTapped ? const Color.fromARGB(200, 255, 255, 255) : null,
          // colorBlendMode: BlendMode.modulate,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
