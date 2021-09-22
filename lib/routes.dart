import 'package:flutter/material.dart';
import 'package:moviestest/splash/splash.dart';
import 'package:moviestest/trending/ui/pages/media_detail_page.dart';
import 'package:moviestest/trending/ui/pages/trending_page.dart';

class Routes {
  Routes._internal();

  static Routes? _instance;
  static Routes? get instance {
    _instance ??= Routes._internal();
    return _instance;
  }

  static const String home = '/';
  static const String movies = '/movies';
  static const String movieDetail = '/movieDetail';

  // ignore: strict_raw_type
  final Map<String, PageRoute Function(dynamic)> _routes = {
    home: (_) => MaterialPageRoute(builder: (_) => const SplashPage()),
    movies: (_) => MaterialPageRoute(builder: (_) => const TrendingListPage()),
    movieDetail: (arguments) => MaterialPageRoute(
        builder: (_) => MediaDetail(url: arguments as String)),
  };

  // ignore: strict_raw_type
  Map<String, PageRoute Function(dynamic)> get getRoutes => _routes;
}
