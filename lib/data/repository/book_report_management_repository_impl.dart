import 'package:book_report/domain/model/book_report.dart';
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
  Future<Result<List<BookReport>>> fetchAllBookReportBy(String bookId) {
    // TODO: implement fetchAllBookReportBy
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> editBookReport({required String bookId, required BookReport report}) {
    // TODO: implement editBookReport
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteBookReport({required String bookId, required BookReport report}) {
    // TODO: implement deleteBookReport
    throw UnimplementedError();
  }
}
