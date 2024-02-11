import 'dart:io';

import 'package:book_report/di/di_setup.dart';
import 'package:book_report/presentation/common/color_constant.dart';
import 'package:book_report/presentation/home_scene/model/local_notification.dart';
import 'package:book_report/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await diSetup();
  await LocalNotification.init();
  await _configureLocalTimeZone();
  await dotenv.load(fileName: '.env');

  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_APP_KEY'],
    javaScriptAppKey: dotenv.env['KAKAO_JS_APP_KEY']
  );


  runApp(ProviderScope(child: const MyApp()));
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();

  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        colorSchemeSeed: ColorConstant.tileColor,
        useMaterial3: true,
      ),
      routerConfig: routes,
    );
  }
}

