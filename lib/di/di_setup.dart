import 'package:book_report/data/repository/book_management_repository_impl.dart';
import 'package:book_report/data/repository/book_report_management_repository_impl.dart';
import 'package:book_report/data/repository/oauth_login_repository_impl.dart';
import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/create_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/delete_book_use_case/delete_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/edit_book_use_case/edit_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/fetch_book_history_use_case/fetch_book_history_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/fetch_book_use_case/fetch_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book_report/create_book_report_use_case/create_book_report_use_case_impl.dart';
import 'package:book_report/domain/usecase/book_report/delete_book_report_use_case/delete_book_report_use_case_impl.dart';
import 'package:book_report/domain/usecase/book_report/edit_book_report_use_case/edit_book_report_use_case_impl.dart';
import 'package:book_report/domain/usecase/book_report/fetch_book_report_list_use_case/fetch_book_report_list_use_case_impl.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/delete_account_use_case_impl.dart';
import 'package:book_report/domain/usecase/logout_use_case/logout_use_case_impl.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/oauth_login_use_case_impl.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/random_advice_use_case_impl.dart';
import 'package:book_report/firebase_options.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_model.dart';
import 'package:book_report/presentation/books_scene/books_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/login_scene/login_view_model.dart';
import 'package:book_report/presentation/main_scene/main_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

Future<void> diSetup() async {
  await _firebaseRegister();

  await _repositoryRegister();
  await _useCaseRegister();
  await _viewModelRegister();
}

Future<void> _firebaseRegister() async {
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);

  _getIt.registerSingleton(firebaseAuth);
}

Future<void> _repositoryRegister() async {
  _getIt.registerSingleton(RandomAdviceRepositoryImpl());
  _getIt.registerSingleton(OAuthLoginRepositoryImpl(firebaseAuth: _getIt.get()));
  _getIt.registerSingleton(BookManagementRepositoryImpl(firebaseAuth: _getIt.get()));

  _getIt.registerSingleton(BookReportManagementRepositoryImpl(firebaseAuth: _getIt.get()));
}

Future<void> _useCaseRegister() async {
  final OAuthLoginRepositoryImpl oAuthLoginRepositoryImpl = _getIt.get();
  final BookManagementRepositoryImpl bookManagementRepositoryImpl = _getIt.get();
  final BookReportManagementRepositoryImpl bookReportManagementRepositoryImpl = _getIt.get();

  _getIt.registerSingleton(OAuthLoginUseCaseImpl(oAuthRepository: oAuthLoginRepositoryImpl));
  _getIt.registerSingleton(LogoutUseCaseImpl(oAuthRepository: oAuthLoginRepositoryImpl));
  _getIt.registerSingleton(DeleteAccountUseCaseImpl(oAuthLoginRepository: oAuthLoginRepositoryImpl));

  _getIt.registerSingleton(RandomAdviceUseCaseImpl(randomAdviceRepository: _getIt.get<RandomAdviceRepositoryImpl>()));

  _getIt.registerSingleton(FetchBookHistoryUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));

  _getIt.registerSingleton(CreateBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(FetchBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(EditBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(DeleteBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));

  _getIt.registerSingleton(FetchBookReportListUseCaseImpl(
    bookReportManagementRepository: bookReportManagementRepositoryImpl,
  ));
  _getIt.registerSingleton(CreateBookReportUseCaseImpl(
    bookReportManagementRepository: bookReportManagementRepositoryImpl,
  ));
  _getIt.registerSingleton(EditBookReportUseCaseImpl(
    bookReportManagementRepository: bookReportManagementRepositoryImpl,
  ));
  _getIt.registerSingleton(DeleteBookReportUseCaseImpl(
    bookReportManagementRepository: bookReportManagementRepositoryImpl,
  ));
}

Future<void> _viewModelRegister() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final dayList = [
    prefs.getBool('sundayTap'),
    prefs.getBool('mondayTap'),
    prefs.getBool('tuesdayTap'),
    prefs.getBool('wednesdayTap'),
    prefs.getBool('thursdayTap'),
    prefs.getBool('fridayTap'),
    prefs.getBool('saturdayTap')
  ];
  final alertHour = prefs.getInt('alertHour');
  final alertMinutes = prefs.getInt('alertMinutes');
  final notificationComment = prefs.getString('notificationComment');

  _getIt.registerSingleton(LoginViewModel(oAuthLoginUseCase: _getIt.get<OAuthLoginUseCaseImpl>()));
  _getIt.registerSingleton(MainViewModel(
    logoutUseCase: _getIt.get<LogoutUseCaseImpl>(),
    deleteAccountUseCase: _getIt.get<DeleteAccountUseCaseImpl>(),
  ));
  _getIt.registerSingleton(HomeViewModel(
      randomAdviceUseCase: _getIt.get<RandomAdviceUseCaseImpl>(),
      prefs: prefs,
      notificationComment: notificationComment,
      sundayTap: dayList[0],
      mondayTap: dayList[1],
      tuesdayTap: dayList[2],
      wednesdayTap: dayList[3],
      thursdayTap: dayList[4],
      fridayTap: dayList[5],
      saturdayTap: dayList[6],
      alertHour: alertHour,
      alertMinutes: alertMinutes));
  _getIt.registerSingleton(BooksViewModel(
    createBookUseCase: _getIt.get<CreateBookUseCaseImpl>(),
    deleteBookUseCase: _getIt.get<DeleteBookUseCaseImpl>(),
    editBookUseCase: _getIt.get<EditBookUseCaseImpl>(),
    fetchBookUseCase: _getIt.get<FetchBookUseCaseImpl>(),
  ));
  _getIt.registerSingleton(BookReportListViewModel(
    fetchBookReportListUseCase: _getIt.get<FetchBookReportListUseCaseImpl>(),
    createBookReportUseCase: _getIt.get<CreateBookReportUseCaseImpl>(),
    editBookReportUseCase: _getIt.get<EditBookReportUseCaseImpl>(),
    deleteBookReportUseCase: _getIt.get<DeleteBookReportUseCaseImpl>(),
  ));
}
