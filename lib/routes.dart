import 'package:flutter/material.dart';
import 'package:moviestest/splash/splash.dart';
import 'package:moviestest/trending/presenter/movie_initial_page.dart';

class Routes {
  Routes._internal();

  static Routes? _instance;
  static Routes? get instance {
    _instance ??= Routes._internal();
    return _instance;
  }

  static const String home = '/';
  static const String movies = '/movies';

  final _routes = {
    home: MaterialPageRoute(builder: (context) => const SplashPage()),
    movies: MaterialPageRoute(builder: (context) => const MovieListPage()),
  };

  // ignore: strict_raw_type
  Map<String, MaterialPageRoute> get getRoutes => _routes;
}
