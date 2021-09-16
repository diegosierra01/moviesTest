import 'package:dio/dio.dart';

import 'package:moviestest/constants/errors.dart';

class AppInterceptors extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (areTroublesInternet(err)) {
      handler.reject(InternetError(err.requestOptions));
    } else if (areTroublesServer(err)) {
      handler.reject(ServerError(err.requestOptions));
    } else {
      handler.reject(UnknownError(err.requestOptions));
    }
  }

  bool areTroublesInternet(DioError err) => err.message.contains('Socket');

  bool areTroublesServer(err) =>
      err.type == DioErrorType.connectTimeout ||
      err.type == DioErrorType.receiveTimeout ||
      err.type == DioErrorType.sendTimeout;
}
