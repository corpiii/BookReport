import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/translator/user_translator.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';

class OAuthLoginUseCaseImpl implements OAuthLoginUseCase {
  final OAuthLoginRepository _oAuthRepository;

  const OAuthLoginUseCaseImpl({
    required OAuthLoginRepository oAuthRepository,
  }) : _oAuthRepository = oAuthRepository;

  @override
  Future<Result<User>> execute(OAuthMethod method) async {
    final translator = UserTranslator();
    final result = await _oAuthRepository.login(method);

    switch (result) {
      case Success<UserDTO>():
        final dto = result.data;
        final user = translator.translateTo(dto);

        return Result.success(user);
      case Error<UserDTO>():
        return Result.error(result.e);
    }
  }
}