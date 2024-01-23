import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';
import 'package:book_report/domain/usecase/book/fetch_book_use_case/interface/fetch_book_use_case.dart';

class FetchBookUseCaseImpl implements FetchBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const FetchBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<List<Book>>> execute() async {
    final translator = BookTranslator();
    final result = await _bookManagementRepository.fetchBookList();

    switch (result) {
      case Success<List<BookDTO>>():
        final data = result.data.map((e) => translator.translateTo(e)).toList();

        return Result.success(data);
      case Error<List<BookDTO>>():
        return Result.error(AppError.fetch.message);
    }
  }

}