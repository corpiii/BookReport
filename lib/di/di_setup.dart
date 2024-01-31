import 'package:book_report/data/repository/book_management_repository_impl.dart';
import 'package:book_report/data/repository/oauth_login_repository_impl.dart';
import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/create_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/delete_book_use_case/delete_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/edit_book_use_case/edit_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/fetch_book_history_use_case/fetch_book_history_use_case_impl.dart';
import 'package:book_report/domain/usecase/book/fetch_book_use_case/fetch_book_use_case_impl.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/delete_account_use_case_impl.dart';
import 'package:book_report/domain/usecase/logout_use_case/logout_use_case_impl.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/oauth_login_use_case_impl.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/random_advice_use_case_impl.dart';
import 'package:book_report/firebase_options.dart';
import 'package:book_report/presentation/books_scene/books_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/login_scene/login_view_model.dart';
import 'package:book_report/presentation/main_scene/main_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

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
}

Future<void> _useCaseRegister() async {
  final OAuthLoginRepositoryImpl oAuthLoginRepositoryImpl = _getIt.get();
  final BookManagementRepositoryImpl bookManagementRepositoryImpl = _getIt.get();

  _getIt.registerSingleton(OAuthLoginUseCaseImpl(oAuthRepository: oAuthLoginRepositoryImpl));
  _getIt.registerSingleton(LogoutUseCaseImpl(oAuthRepository: oAuthLoginRepositoryImpl));
  _getIt.registerSingleton(DeleteAccountUseCaseImpl(oAuthLoginRepository: oAuthLoginRepositoryImpl));

  _getIt.registerSingleton(RandomAdviceUseCaseImpl(randomAdviceRepository: _getIt.get<RandomAdviceRepositoryImpl>()));

  _getIt.registerSingleton(FetchBookHistoryUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));

  _getIt.registerSingleton(CreateBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(FetchBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(EditBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
  _getIt.registerSingleton(DeleteBookUseCaseImpl(bookManagementRepository: bookManagementRepositoryImpl));
}

Future<void> _viewModelRegister() async {
  _getIt.registerSingleton(LoginViewModel(oAuthLoginUseCase: _getIt.get<OAuthLoginUseCaseImpl>()));
  _getIt.registerSingleton(MainViewModel(
    logoutUseCase: _getIt.get<LogoutUseCaseImpl>(),
    deleteAccountUseCase: _getIt.get<DeleteAccountUseCaseImpl>(),
  ));
  _getIt.registerSingleton(HomeViewModel(randomAdviceUseCase: _getIt.get<RandomAdviceUseCaseImpl>()));
  _getIt.registerSingleton(BooksViewModel(
    createBookUseCase: _getIt.get<CreateBookUseCaseImpl>(),
    deleteBookUseCase: _getIt.get<DeleteBookUseCaseImpl>(),
    editBookUseCase: _getIt.get<EditBookUseCaseImpl>(),
    fetchBookUseCase: _getIt.get<FetchBookUseCaseImpl>(),
  ));
}
