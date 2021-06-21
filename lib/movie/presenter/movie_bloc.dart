import 'package:flutter/cupertino.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/domain/usecases/weeklyMovies.dart';

class MovieBloc with ChangeNotifier {
  final WeeklyMovies weeklyMovies;
  final state = ValueNotifier<States>(States.Loading);
  final setup = ValueNotifier<String>('grid');
  final error = ValueNotifier<GenericError>(NoError());
  final _controller = ScrollController();
  late List<Movie> _movies = [];
  late int _totalPages = 1;
  late int _nextPage = 1;
  late bool _over = false;
  MovieBloc(this.weeklyMovies);

  List<Movie> get getMovies => _movies;

  ScrollController get getController => _controller;

  bool get isOver => _over;

  Future<void> loadData() async {
    if (state.value != States.AdditionalLoading) {
      if (getMovies.isNotEmpty) state.value = States.AdditionalLoading;
      final data = await weeklyMovies.load(_nextPage, _totalPages);
      data.fold(
        (page) {
          getMovies.addAll(page.movies);
          _totalPages = page.totalPages;
          _nextPage++;
          state.value = States.Finished;
        },
        (error) {
          if (error is MoviePageError) {
            _over = true;
            state.value = States.Finished;
          }
        },
      );
    }
  }
}
