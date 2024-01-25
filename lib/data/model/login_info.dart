import 'package:book_report/data/model/login_user.dart';

class LoginInfo {
  LoginUser? currentUser;
  bool get isGuest => currentUser == null;
}