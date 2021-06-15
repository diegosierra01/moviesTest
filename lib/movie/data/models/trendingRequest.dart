class TrendingRequest {
  final String apiKey;
  final int page;
  final String mediaType;
  final String timeWindow;

  TrendingRequest(
      {required this.apiKey,
      required this.page,
      required this.mediaType,
      required this.timeWindow});

  String getPath() =>
      '${this.mediaType}/${this.timeWindow}?api_key=${this.apiKey}&page=${this.page}';
}
