import 'package:book_report/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OAuthLoginView extends StatefulWidget {
  const OAuthLoginView({super.key});

  @override
  State<OAuthLoginView> createState() => _OAuthLoginViewState();
}

class _OAuthLoginViewState extends State<OAuthLoginView> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
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
            _loginIcon('assets/image/logo.png'),
            const SizedBox(width: 30,),
            _loginIcon('assets/image/logo.png'),
            const SizedBox(width: 30,),
            _loginIcon('assets/image/logo.png'),
          ],
        )
      ],
    );
  }

  Widget _loginIcon(String imageUrl) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
      },
      onTap: () {
        context.go(mainPath);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Image.asset(
          imageUrl,
          color: _isTapped ? const Color.fromARGB(200, 255, 255, 255) : null,
          colorBlendMode: BlendMode.modulate,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
