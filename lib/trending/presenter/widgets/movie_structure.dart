import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/trending/presenter/layout/movie_layout_type.dart';
import 'package:moviestest/trending/presenter/layout/movies_layout_presenter.dart';
import 'package:moviestest/trending/presenter/widgets/movie_grid_card.dart';
import 'package:moviestest/trending/presenter/widgets/movie_grid_view.dart';
import 'package:moviestest/trending/presenter/widgets/movie_list_card.dart';
import 'package:provider/provider.dart';
import 'package:moviestest/trending/presenter/movie_bloc.dart';
import 'package:moviestest/trending/presenter/widgets/movie_list_view.dart';

class MovieStructure extends StatelessWidget {
  const MovieStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    final _size = MediaQuery.of(context).size;
    final _layoutPresenter = Provider.of<MoviesLayoutPresenter>(context);
    return SizedBox(
      height: _size.height * 0.75,
      child: ValueListenableBuilder(
        valueListenable: _bloc.state,
        builder: (context, state, child) {
          final movies = _bloc.getMovies;
          if (state == States.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo is ScrollEndNotification &&
                      scrollInfo.metrics.extentAfter == 0) {
                    _bloc.loadData();
                    return true;
                  }
                  return false;
                },
                child: _layoutPresenter.getMovieLayout == MovieLayoutType.grid
                    ? MovieListView(
                        length: (movies.length) + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == movies.length &&
                              !_bloc.isOver &&
                              state == States.additionalLoading) {
                            return SizedBox(
                              height: _size.height * 0.1,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (index < movies.length) {
                            final element = movies[index];
                            return MovieListCard(
                              imagePath: element.posterPath,
                              title: element.title,
                              date: element.getDefaultDateFormat,
                            );
                          }
                          return Container();
                        },
                      )
                    : MovieGridView(
                        length: (movies.length) + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == movies.length &&
                              !_bloc.isOver &&
                              state == States.additionalLoading) {
                            return Container(
                              height: _size.height * 0.05,
                              padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.1,
                              ),
                              child: const Center(
                                child: LinearProgressIndicator(),
                              ),
                            );
                          }
                          if (index < movies.length) {
                            final element = movies[index];
                            return MovieGridCard(
                              imagePath: element.posterPath,
                              title: element.title,
                              date: element.getDefaultDateFormat,
                            );
                          }
                          return Container();
                        },
                      ));
          }
        },
      ),
    );
  }
}
