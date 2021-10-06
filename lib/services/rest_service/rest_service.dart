import 'dart:async';

abstract class RestService {
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String> parameters,
  });
  Future<Map<String, dynamic>> post({
    required String path,
    body,
    Map<String, String> parameters,
  });
  Future<Map<String, dynamic>> put({
    required String path,
    body,
    Map<String, String> parameters,
  });
  Future<Map<String, dynamic>> delete({
    required String path,
    body,
    Map<String, String> parameters,
  });
  FutureOr<Map<String, dynamic>> onError(Object error);
}
