import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/interface/delete_account_use_case.dart';

class DeleteAccountUseCaseImpl implements DeleteAccountUseCase {
  final OAuthLoginRepository _oAuthLoginRepository;

  const DeleteAccountUseCaseImpl({
    required OAuthLoginRepository oAuthLoginRepository,
  }) : _oAuthLoginRepository = oAuthLoginRepository;

  @override
  Future<Result<void>> execute() async {
    return await _oAuthLoginRepository.deleteAccount();
  }
}