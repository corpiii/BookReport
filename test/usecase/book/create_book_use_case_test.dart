import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/create_book_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_double/book_management_repository_stub.dart';

void main() {
  test('create_book_is_success', () async {
    // given
    final repository = BookManagementRepositoryStub();
    final sut = CreateBookUseCaseImpl(bookManagementRepository: repository);
    const testTitle = 'create book test title';

    // when
    final result = await sut.execute(title: testTitle);

    // then
    switch (result) {
      case Success<Book>():
        final data = result.data;

        expect(data.title, testTitle);
      case Error<Book>():
        throwsA(AppError.create.message);
    }
  });
}