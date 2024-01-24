import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/usecase/logout_use_case/interface/logout_use_case.dart';

class LogoutUseCaseImpl implements LogoutUseCase {
  final OAuthLoginRepository _oAuthRepository;

  const LogoutUseCaseImpl({
    required OAuthLoginRepository oAuthRepository,
  }) : _oAuthRepository = oAuthRepository;

  @override
  Future<Result<bool>> execute() async {
    return Result.error('e');
  }
}