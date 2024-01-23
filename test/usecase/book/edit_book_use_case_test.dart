import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book/edit_book_use_case/edit_book_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_double/book_dummy.dart';
import '../test_double/book_management_repository_stub.dart';

void main() {
  test('edit book is success', () async {
    // given
    final repository = BookManagementRepositoryStub();
    final sut = EditBookUseCaseImpl(bookManagementRepository: repository);
    const changedTitle = 'change title';
    Book dummy = BookListDummy.dummy[0];

    // when
    dummy.title = changedTitle;

    final result = await sut.execute(dummy);

    // then
    switch (result) {
      case Success<Book>():
        expect(result.data.author, dummy.author);
        expect(result.data.title, changedTitle);
      case Error<Book>():
        throwsA(AppError.delete.message);
    }
  });
}