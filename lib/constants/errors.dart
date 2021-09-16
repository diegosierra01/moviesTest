import 'package:dio/dio.dart';

abstract class GenericError implements Exception {}

class NoError implements GenericError {}

class UnknownError extends DioError implements GenericError {
  RequestOptions newRequestOptions;

  UnknownError(this.newRequestOptions)
      : super(requestOptions: newRequestOptions);
}

class ServerError extends DioError implements GenericError {
  final RequestOptions newRequestOptions;

  ServerError(this.newRequestOptions)
      : super(requestOptions: newRequestOptions);
}

class InternetError extends DioError implements GenericError {
  final RequestOptions newRequestOptions;

  InternetError(this.newRequestOptions)
      : super(requestOptions: newRequestOptions);
}
