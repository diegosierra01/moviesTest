import 'package:dio/dio.dart';

import 'constants/errors.dart';

class AppInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.message.contains('Socket')) {
      throw InternetError();
    } else if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.sendTimeout) {
      throw ServerError();
    }
    throw UnknownError();
  }
}
