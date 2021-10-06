import 'package:dio/dio.dart';

import 'package:moviestest/errors/errors.dart';

class AppInterceptors extends InterceptorsWrapper {
  final Map<Function(DioError), Exception> knownErrors = {
    areTroublesInternet: InternetError(),
    areTroublesServer: ServerError(),
  };

  static bool areTroublesInternet(DioError dioError) =>
      dioError.message.contains('Socket');

  static bool areTroublesServer(DioError dioError) =>
      dioError.type == DioErrorType.connectTimeout ||
      dioError.type == DioErrorType.receiveTimeout ||
      dioError.type == DioErrorType.sendTimeout;

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    knownErrors.forEach(
      (isKnownError, errorResponse) {
        if (isKnownError(err) == true) {
          throw errorResponse;
        }
      },
    );
    throw UnknownError();
  }
}
