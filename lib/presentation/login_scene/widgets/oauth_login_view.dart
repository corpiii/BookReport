import 'package:book_report/di/view_model_provider.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';

import '../../../routes.dart';

class OAuthLoginView extends ConsumerWidget {
  const OAuthLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);

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
                viewModel.login(
                  method: OAuthMethod.google,
                  onComplete: () {
                    context.go(mainPath);
                  },
                  onError: (message) {},
                );
              },
            ),
            const SizedBox(width: 30),
            Platform.isIOS
                ? _loginIcon(
                    'assets/image/apple_sign_icon.png',
                    onTap: () {
                      viewModel.login(
                        method: OAuthMethod.apple,
                        onComplete: () {
                          context.go(mainPath);
                        },
                        onError: (message) {
                          print(message);
                        },
                      );
                    },
                  )
                : Container(),
            Platform.isIOS ? const SizedBox(width: 30) : Container(),
            _loginIcon(
              'assets/image/kakao_sign_icon.png',
              onTap: () {
                viewModel.login(
                  method: OAuthMethod.kakao,
                  onComplete: () {
                    context.go(mainPath);
                  },
                  onError: (message) {
                    print(message);
                  },
                );
              },
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
