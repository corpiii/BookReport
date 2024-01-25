import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';

class OAuthLoginUseCaseImpl implements OAuthLoginUseCase {
  final OAuthLoginRepository _oAuthRepository;

  const OAuthLoginUseCaseImpl({
    required OAuthLoginRepository oAuthRepository,
  }) : _oAuthRepository = oAuthRepository;

  @override
  Future<Result<void>> execute(OAuthMethod method) async {
    return await _oAuthRepository.login(method);
  }
}