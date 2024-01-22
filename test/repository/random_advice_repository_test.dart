import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'success_fetch_advice_by_RandomAdviceRepository',
    () async {
      // given
      final sut = RandomAdviceRepositoryImpl();

      // when
      final advice = await sut.fetchRandomAdvice();

      // then
      print(advice);
      expect(advice is String, true);
    },
  );
}
