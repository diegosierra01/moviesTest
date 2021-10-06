import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/services/rest_service/rest_service.dart';
import 'package:http/http.dart';

class HttpServiceImpl implements RestService {
  final Client httpClient;

  HttpServiceImpl(this.httpClient);

  @override
  Future<Map<String, dynamic>> delete(
      {required String path,
      body = const {},
      Map<String, String> parameters = const {}}) async {
    final response = await httpClient
        .delete(
          Uri.parse(path),
          headers: parameters,
          body: body,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String path, Map<String, String> parameters = const {}}) async {
    final response = await httpClient
        .get(
          Uri.parse(path),
          headers: parameters,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String path,
      body = const {},
      Map<String, String> parameters = const {}}) async {
    final response = await httpClient
        .post(
          Uri.parse(path),
          headers: parameters,
          body: body,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      throw BadRequestError();
    }
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String path,
      body = const {},
      Map<String, String> parameters = const {}}) async {
    final response = await httpClient
        .put(
          Uri.parse(path),
          headers: parameters,
          body: body,
        )
        .catchError(onError);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      throw BadRequestError();
    }
  }

  @override
  FutureOr<Map<String, dynamic>> onError(Object error) {
    // TODO: implement onError
    if (error is SocketException) {
    } else if (error is TimeoutException) {}
    throw UnimplementedError();
  }
}
