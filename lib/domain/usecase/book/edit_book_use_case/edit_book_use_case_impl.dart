import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';

import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';

import 'interface/edit_book_use_case.dart';

class EditBookUseCaseImpl implements EditBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const EditBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<Book>> execute(Book model) async {
    final translator = BookTranslator();
    final dto = translator.translateFrom(model);
    final result = await _bookManagementRepository.editBook(model: dto);

    switch (result) {
      case Success<BookDTO>():
        final data = translator.translateTo(result.data);

        return Result.success(data);
      case Error<BookDTO>():
        return Result.error(AppError.delete.message);
    }
  }
}