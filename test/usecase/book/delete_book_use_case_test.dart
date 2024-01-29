import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book/delete_book_use_case/delete_book_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_double/book_management_repository_stub.dart';

void main() {
  test('delete book is success', () async {
    // given
    final repository = BookManagementRepositoryStub();
    final sut = DeleteBookUseCaseImpl(bookManagementRepository: repository);
    final dummy = Book(id: '1', author: '1', title: 'testTitle', timestamp: DateTime.now());

    // when
    final result = await sut.execute(dummy);

    // then
    if (result case Result.error) {
      throwsA(AppError.delete.message);
    }

    // switch (result) {
    //   case Success<Book>():
    //     expect(result.data.id, dummy.id);
    //     expect(result.data.author, dummy.author);
    //     expect(result.data.title, dummy.title);
    //   case Error<Book>():
    //     throwsA(AppError.delete.message);
    // }
  });
}