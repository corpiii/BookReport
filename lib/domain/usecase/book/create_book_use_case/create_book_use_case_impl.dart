import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/interface/create_book_use_case.dart';

class CreateBookUseCaseImpl implements CreateBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const CreateBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<Book>> execute({required String title}) async {
    final translator = BookTranslator();
    final result = await _bookManagementRepository.createBook(title: title);

    switch (result) {
      case Success<BookDTO>():
        final data = translator.translateTo(result.data);

        return Result.success(data);
      case Error<BookDTO>():
        return Result.error(AppError.create.message);
    }
  }
}