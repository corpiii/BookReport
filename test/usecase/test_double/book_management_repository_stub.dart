import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:uuid/uuid.dart';

import 'book_history_dto_list_dummy.dart';
import 'book_dummy.dart';

class BookManagementRepositoryStub implements BookManagementRepository {
  @override
  Future<Result<BookDTO>> createBook({required String title}) async {
    final dto = BookDTO(id: Uuid().v1(), title: title);

    return Result.success(dto);
  }

  @override
  Future<Result<BookDTO>> deleteBook({required BookDTO model}) async {
    return Result.success(model);
  }

  @override
  Future<Result<BookDTO>> editBook({required BookDTO model}) async {
    return Result.success(model);
  }

  @override
  Future<Result<List<BookDTO>>> fetchBookList() async {
    return Result.success(BookDTOListDummy.dummy);
  }

  @override
  Future<Result<List<BookHistoryDTO>>> fetchReportHistory() async {
    return Result.success(BookHistoryDTOListDummy.dummy);
  }
  
}