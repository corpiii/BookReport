import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/interface/create_book_use_case.dart';
import 'package:uuid/uuid.dart';

class CreateBookUseCaseImpl implements CreateBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const CreateBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<void>> execute({required String title}) async {
    final result = await _bookManagementRepository.createBook(
      id: Uuid().v1(),
      title: title,
    );

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(AppError.create.message);
    }
  }
}
