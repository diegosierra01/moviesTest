import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/layout/movie_layout_type.dart';

class MoviesLayoutPresenter extends ChangeNotifier {
  MovieLayoutType _movieLayout = MovieLayoutType.grid;

  MovieLayoutType get getMovieLayout => _movieLayout;

  set setMovieLayout(MovieLayoutType movieLayout) {
    _movieLayout = movieLayout;
    notifyListeners();
  }
}
