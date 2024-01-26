import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';
import 'package:book_report/domain/usecase/book/delete_book_use_case/interface/delete_book_use_case.dart';

class DeleteBookUseCaseImpl implements DeleteBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const DeleteBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<void>> execute(Book model) async {
    final translator = BookTranslator();
    final dto = translator.translateFrom(model);
    final result = await _bookManagementRepository.deleteBook(model: dto);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(AppError.delete.message);
    }
  }
}