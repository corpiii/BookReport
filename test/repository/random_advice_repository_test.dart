import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetch anything on RandomAdviceRepository',
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
