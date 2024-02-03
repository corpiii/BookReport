enum AppError {
  create, fetch, edit, delete;

  String get message {
    String result = '';

    switch (AppError) {
      case AppError.create:
        result = 'failed to create';
      case AppError.fetch:
        result = 'failed to fetch';
      case AppError.edit:
        result = 'failed to edit';
      case AppError.delete:
        result = 'failed to delete';
    }

    return result;
  }
}

enum OAuthError {
  login,
  notExistCurrentUser,
  notSupported,
  notDeletedAccount;

  String get message {
    String result = '';

    switch (OAuthError) {
      case OAuthError.login:
        result = 'failed to google login';
      case OAuthError.notExistCurrentUser:
        result = 'nobody login in app';
      case OAuthError.notSupported:
        result = 'not supported method';
      case OAuthError.notDeletedAccount:
        result = 'not deleted account';
    }

    return result;
  }
}