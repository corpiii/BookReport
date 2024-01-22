import 'package:book_report/domain/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/domain/repository/random_advice_repository.dart';

class RandomAdviceUseCaseImpl implements RandomAdviceUseCase {
  final RandomAdviceRepository _randomAdviceRepository;

  const RandomAdviceUseCaseImpl({
    required RandomAdviceRepository randomAdviceRepository,
  }) : _randomAdviceRepository = randomAdviceRepository;

  @override
  Future<String> execute() async {
    return await _randomAdviceRepository.fetchRandomAdvice();
  }
}