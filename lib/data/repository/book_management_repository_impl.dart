import 'package:book_report/data/dao/book_dao.dart';
import 'package:book_report/data/translator/book_dao_translator.dart';
import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookManagementRepositoryImpl implements BookManagementRepository {
  final String _bookCollectionName = 'book';
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
    if (_firebaseAuth.currentUser == null) return Result.error(AppError.fetch.message);

    try {
      final snapshots = await FirebaseFirestore.instance
          .collection(_bookCollectionName)
          .where('author', isEqualTo: _firebaseAuth.currentUser!.uid)
          .get();
      final bookDAOList = snapshots.docs.map((e) => BookDAO.fromJson(e.data())).toList();
      final translator = BookDAOTranslator();
      final bookList = bookDAOList.map((e) => translator.translateTo(e)).toList();
      
      return Result.success(bookList);
    } catch (error) {
      return Result.error(AppError.fetch.message);
    }


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
