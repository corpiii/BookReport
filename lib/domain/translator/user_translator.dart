import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/translator/interface/translator.dart';

class UserTranslator implements Translator<UserDTO, User> {
  @override
  UserDTO translateFrom(User data) {
    return UserDTO(uid: data.uid, displayName: data.displayName, photoUrl: data.photoUrl);
  }

  @override
  User translateTo(UserDTO data) {
    return User(uid: data.uid, displayName: data.displayName, photoUrl: data.photoUrl);
  }
}