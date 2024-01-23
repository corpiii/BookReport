import 'package:book_report/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<FirebaseApp> _firebaseInit() async {
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return app;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInit(),
      builder: (context, snapshot) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            // splashColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: routes,
        );
      },
    );
  }
}
