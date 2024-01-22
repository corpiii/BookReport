import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';

class RandomAdviceUseCaseImpl implements RandomAdviceUseCase {
  final RandomAdviceRepository _randomAdviceRepository;

  const RandomAdviceUseCaseImpl({
    required RandomAdviceRepository randomAdviceRepository,
  }) : _randomAdviceRepository = randomAdviceRepository;

  @override
  Future<String> execute() async {
    final advice = await _randomAdviceRepository.fetchRandomAdvice();
    final trimmedAdvice = advice.replaceAll('. ', '.\n');

    return trimmedAdvice;
  }
}