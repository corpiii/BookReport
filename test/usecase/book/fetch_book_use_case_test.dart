import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book/fetch_book_use_case/fetch_book_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_double/book_dummy.dart';
import '../test_double/book_management_repository_stub.dart';


void main() {
  test('fetch book is success', () async {
    // given
    final repository = BookManagementRepositoryStub();
    final sut = FetchBookUseCaseImpl(bookManagementRepository: repository);

    // when
    final result = await sut.execute();

    // then
    switch (result) {
      case Success<List<Book>>():
        result.data.asMap().forEach((index, element) {
          expect(element.id, BookListDummy.dummy[index].id);
        });
      case Error<List<Book>>():
        throwsA(AppError.fetch.message);
    }
  });
}