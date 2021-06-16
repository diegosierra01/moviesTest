import 'package:flutter/cupertino.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/domain/usecases/weeklyMovies.dart';

class MovieBloc with ChangeNotifier {
  final WeeklyMovies weeklyMovies;
  final state = ValueNotifier<States>(States.Busy);
  late List<Movie> _movies;
  late int _totalPages = 1;
  late int _nextPage = 1;
  MovieBloc(this.weeklyMovies);

  set setMovies(List<Movie> movies) {
    _movies = movies;
  }

  List<Movie> get getMovies => _movies;

  Future<void> loadData() async {
    final data = await weeklyMovies.load(_nextPage, _totalPages);
    data.fold(
      (page) {
        setMovies = page.movies;
        _totalPages = page.totalPages;
        _nextPage++;
        state.value = States.Idle;
      },
      (error) => null,
    );
  }
}
