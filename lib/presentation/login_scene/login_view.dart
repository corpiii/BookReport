import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/login_scene/widgets/guest_login_view.dart';
import 'package:book_report/presentation/login_scene/widgets/logo_view.dart';
import 'package:book_report/presentation/login_scene/widgets/oauth_login_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoView(),
          SizedBox(height: 30),
          GuestLoginView(),
          OAuthLoginView(),
        ],
      ),
    );
  }
}
