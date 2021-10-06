import 'package:flutter/material.dart';
import 'package:moviestest/trending/presentation/presenter/media_layout_state.dart';

class MoviesLayoutPresenter extends ChangeNotifier {
  MediaLayoutState _movieLayout = MediaLayoutState.grid;

  MediaLayoutState get getMovieLayout => _movieLayout;

  set setMovieLayout(MediaLayoutState movieLayout) {
    _movieLayout = movieLayout;
    notifyListeners();
  }
}
