import 'package:moviestest/constants/endpoints.dart';

class TrendingRequest {
  final int page;
  final String mediaType;
  final String timeWindow;

  TrendingRequest({
    required this.page,
    required this.mediaType,
    required this.timeWindow,
  });

  String get getPath =>
      '${Endpoints.baseUrl}$mediaType/$timeWindow?api_key=${Endpoints.apiKeyIMDb}&page=$page';
}
