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