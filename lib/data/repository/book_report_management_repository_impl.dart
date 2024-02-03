import 'package:book_report/data/dao/book_report_dao.dart';
import 'package:book_report/data/translator/book_report_dao_translator.dart';
import 'package:book_report/domain/dto/book_report_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookReportManagementRepositoryImpl implements BookReportManagementRepository {
  final CollectionReference<Map<String, dynamic>> _bookReportCollection =
  FirebaseFirestore.instance.collection('bookReport');
  final FirebaseAuth _firebaseAuth;

  BookReportManagementRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<Result<void>> createBookReport({
    required String title,
    required String content,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<BookReportDTO>>> fetchAllBookReportBy(String bookId) async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notExistCurrentUser.message);

    final userID = _firebaseAuth.currentUser!;
    final snapshot = await _bookReportCollection.doc(userID.uid).collection(bookId).get();
    final translator = BookReportDAOTranslator();
    final bookReportDAOList = snapshot.docs.map((e) => BookReportDAO.fromJson(e.data())).toList();
    final bookReportDTOList = bookReportDAOList.map((e) => translator.translateTo(e)).toList();

    return Result.success(bookReportDTOList);
  }

  @override
  Future<Result<void>> editBookReport({required String bookId, required BookReportDTO report}) {
    // TODO: implement editBookReport
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteBookReport({required String bookId, required BookReportDTO report}) {
    // TODO: implement deleteBookReport
    throw UnimplementedError();
  }
}
