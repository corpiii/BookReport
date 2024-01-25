import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookManagementRepositoryImpl implements BookManagementRepository {
  FirebaseAuth _firebaseAuth;

  BookManagementRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<Result<BookDTO>> createBook({required String title}) {
    // TODO: implement createBook
    throw UnimplementedError();
  }

  @override
  Future<Result<BookDTO>> deleteBook({required BookDTO model}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Result<BookDTO>> editBook({required BookDTO model}) {
    // TODO: implement editBook
    throw UnimplementedError();
  }

  @override
  Future<Result<List<BookDTO>>> fetchBookList() async {
    return Result.success([
      BookDTO(author: '1', id: '1', title: 'title'),
      BookDTO(author: '1', id: '1', title: 'title1'),
      BookDTO(author: '1', id: '1', title: 'title2'),
    ]);
  }

  @override
  Future<Result<List<BookHistoryDTO>>> fetchReportHistory() {
    // TODO: implement fetchReportHistory
    throw UnimplementedError();
  }
}
