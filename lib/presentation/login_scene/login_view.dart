import 'package:book_report/presentation/login_scene/widgets/logo_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoView(),
          // OAuthLoginView(),
        ],
      ),
    );
  }
}
