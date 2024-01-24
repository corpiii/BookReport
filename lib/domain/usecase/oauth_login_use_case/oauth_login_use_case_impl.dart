import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/repository/oauth_repository/google_login_repository.dart';
import 'package:book_report/domain/translator/user_translator.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';

class OAuthLoginUseCaseImpl implements OAuthLoginUseCase {
  final GoogleLoginRepository _googleLoginRepository;

  const OAuthLoginUseCaseImpl({
    required GoogleLoginRepository googleLoginRepository,
  }) : _googleLoginRepository = googleLoginRepository;

  @override
  Future<Result<User>> execute(OAuthMethod method) async {
    final Result<UserDTO> result;
    final translator = UserTranslator();

    switch (method) {
      case OAuthMethod.apple:
        // TODO: Handle this case.
      case OAuthMethod.google:
        result = await _googleLoginRepository.login();
      case OAuthMethod.kakao:
        // TODO: Handle this case.
      default:
        result = Result.error('method error');
    }

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