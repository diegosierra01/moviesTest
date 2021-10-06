import 'dart:async';

import 'package:dio/dio.dart';
import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/interceptor.dart';
import 'package:moviestest/services/rest_service/rest_service.dart';

class DioServiceImpl implements RestService {
  final Dio dioClient;
  final Options _options = Options(
    followRedirects: false,
    validateStatus: (status) => status! < 510,
  );

  DioServiceImpl(this.dioClient);

  void loadInterceptor() {
    dioClient.interceptors.add(AppInterceptors());
  }

  @override
  Future<Map<String, dynamic>> delete(
      {required String path,
      body = const {},
      Map<String, String> parameters = const {}}) async {
    final response = await dioClient
        .delete(
          path,
          data: body,
          queryParameters: parameters,
          options: _options,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String> parameters = const {},
  }) async {
    final response = await dioClient
        .get(
          path,
          queryParameters: parameters,
          options: _options,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> post({
    required String path,
    body = const {},
    Map<String, String> parameters = const {},
  }) async {
    final response = await dioClient
        .post(
          path,
          data: body,
          queryParameters: parameters,
          options: _options,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> put({
    required String path,
    body = const {},
    Map<String, String> parameters = const {},
  }) async {
    final response = await dioClient.put(
      path,
      data: body,
      queryParameters: parameters,
      options: _options,
    );
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw BadRequestError();
    }
  }

  @override
  FutureOr<Map<String, dynamic>> onError(Object dioError) {
    throw (dioError as DioError).error as GenericError;
  }
}
