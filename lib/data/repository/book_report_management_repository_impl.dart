import 'dart:async';

import 'package:book_report/data/dao/book_report_dao.dart';
import 'package:book_report/data/translator/book_report_dao_translator.dart';
import 'package:book_report/domain/dto/book_report_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class BookReportManagementRepositoryImpl implements BookReportManagementRepository {
  final CollectionReference<Map<String, dynamic>> _bookReportCollection =
      FirebaseFirestore.instance.collection('bookReport');
  final FirebaseAuth _firebaseAuth;

  BookReportManagementRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<Result<void>> createBookReport({
    required String bookId,
    required String title,
    required String content,
  }) async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notExistCurrentUser.message);

    try {
      final userID = _firebaseAuth.currentUser!;
      final dao = BookReportDAO(
        id: Uuid().v1(),
        author: userID.uid,
        title: title,
        content: content,
        timestamp: DateTime.now().toIso8601String(),
      );

      await _bookReportCollection.doc(userID.uid).collection(bookId).add(dao.toJson());

      return Result.success(());
    } catch (_) {
      return Result.error(AppError.create.message);
    }
  }

  @override
  Future<Result<List<BookReportDTO>>> fetchAllBookReportBy(String bookId) async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notExistCurrentUser.message);

    try {
      final userID = _firebaseAuth.currentUser!;
      final snapshot = await _bookReportCollection.doc(userID.uid).collection(bookId).get();
      final translator = BookReportDAOTranslator();
      final bookReportDAOList = snapshot.docs.map((e) => BookReportDAO.fromJson(e.data())).toList();
      final bookReportDTOList = bookReportDAOList.map((e) => translator.translateTo(e)).toList();

      return Result.success(bookReportDTOList);
    } catch (_) {
      return Result.error(AppError.fetch.message);
    }
  }

  @override
  Future<Result<void>> editBookReport({required String bookId, required BookReportDTO report}) async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notExistCurrentUser.message);

    try {
      final translator = BookReportDAOTranslator();
      final userID = _firebaseAuth.currentUser!;
      final modelId = report.id;
      final snapshot = await _bookReportCollection
          .doc(userID.uid)
          .collection(bookId)
          .where('id', isEqualTo: modelId)
          .limit(1)
          .get();

      final searchedModelDocId = snapshot.docs[0].id;

      await _bookReportCollection
          .doc(userID.uid)
          .collection(bookId)
          .doc(searchedModelDocId)
          .update(translator.translateFrom(report).toJson());

      return Result.success(());
    } catch (_) {
      return Result.error(AppError.edit.message);
    }
  }

  @override
  Future<Result<void>> deleteBookReport({required String bookId, required BookReportDTO report}) async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notExistCurrentUser.message);

    try {
      final userID = _firebaseAuth.currentUser!;
      final modelId = report.id;
      final snapshot = await _bookReportCollection
          .doc(userID.uid)
          .collection(bookId)
          .where('id', isEqualTo: modelId)
          .limit(1)
          .get();

      final searchedModelDocId = snapshot.docs[0].id;

      await _bookReportCollection
          .doc(userID.uid)
          .collection(bookId)
          .doc(searchedModelDocId)
          .delete();

      return Result.success(());
    } catch (_) {
      return Result.error(AppError.delete.message);
    }
  }
}
