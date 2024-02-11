import 'package:book_report/domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class LoginService {
  Future<Result<void>> login();
}