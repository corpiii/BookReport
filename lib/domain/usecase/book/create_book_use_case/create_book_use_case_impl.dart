import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/book_translator.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/interface/create_book_use_case.dart';

class CreateBookUseCaseImpl implements CreateBookUseCase {
  final BookManagementRepository _bookManagementRepository;

  const CreateBookUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Book?> execute({required String title}) async {
    final translator = BookTranslator();
    final result = await _bookManagementRepository.createBook(title: title);

    return translator.translateTo(result!);
  }
}