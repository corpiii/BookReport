import 'package:book_report/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

Future<void> diSetup() async {
  final getIt = GetIt.instance;
  final FirebaseAuth firebaseAuth = await _firebaseInit();

  getIt.registerSingleton(firebaseAuth);
}

Future<FirebaseAuth> _firebaseInit() async {
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return FirebaseAuth.instanceFor(app: app);
}