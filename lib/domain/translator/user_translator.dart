import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/translator/interface/translator.dart';

class UserTranslator implements Translator<UserDTO, User> {
  @override
  UserDTO translateFrom(User data) {
    return UserDTO(id: data.id, uid: data.uid, email: data.email);
  }

  @override
  User translateTo(UserDTO data) {
    return User(id: data.id, uid: data.uid, email: data.email);
  }
  
}