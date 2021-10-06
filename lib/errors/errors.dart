abstract class GenericError implements Exception {
  final String? message;

  GenericError({this.message});
}

class NoError implements GenericError {
  @override
  final String? message;

  NoError({this.message});
}

class BadRequestError implements GenericError {
  @override
  final String? message;

  BadRequestError({this.message});
}

class UnknownError implements GenericError {
  @override
  final String? message;

  UnknownError({this.message});
}

class ServerError implements GenericError {
  @override
  final String? message;

  ServerError({this.message});
}

class InternetError implements GenericError {
  @override
  final String? message;

  InternetError({this.message});
}
