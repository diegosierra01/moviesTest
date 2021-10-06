import 'package:moviestest/errors/errors.dart';

class MovieDatasourceError implements GenericError {
  @override
  final String? message;

  MovieDatasourceError({this.message});
}

class MovieRepositoryError implements GenericError {
  @override
  final String? message;

  MovieRepositoryError({this.message});
}

class MovieLastPageError implements GenericError {
  @override
  final String? message;

  MovieLastPageError({this.message});
}
