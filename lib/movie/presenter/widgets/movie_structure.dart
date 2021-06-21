import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/movie/presenter/widgets/movie_grid_card.dart';
import 'package:moviestest/movie/presenter/widgets/movie_grid_view.dart';
import 'package:moviestest/movie/presenter/widgets/movie_list_card.dart';
import 'package:provider/provider.dart';

import '../movie_bloc.dart';
import 'movie_list_view.dart';

class MovieStructure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.75,
      child: ValueListenableBuilder(
        valueListenable: _bloc.state,
        builder: (context, state, child) {
          final movies = _bloc.getMovies;
          if (state == States.Loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.extentAfter == 0) {
                  _bloc.loadData();
                  return true;
                }
                return false;
              },
              child: ValueListenableBuilder(
                valueListenable: _bloc.setup,
                builder: (BuildContext context, setup, Widget? child) {
                  initializeDateFormatting('es');
                  if (setup == 'list') {
                    return MovieListView(
                      length: (movies.length) + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == movies.length &&
                            !_bloc.isOver &&
                            state == States.AdditionalLoading)
                          return Container(
                            height: _size.height * 0.1,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        if (index < movies.length) {
                          final element = movies[index];
                          return MovieListCard(
                            imagePath: element.posterPath,
                            title: element.title,
                            date: element.releaseDate.year != 0
                                ? "${element.releaseDate.day} de ${DateFormat.MMMM('es').format(element.releaseDate).toString()} del ${element.releaseDate.year}"
                                : '',
                          );
                        }
                        return Container();
                      },
                    );
                  } else {
                    return MovieGridView(
                      length: (movies.length) + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == movies.length &&
                            !_bloc.isOver &&
                            state == States.AdditionalLoading)
                          return Container(
                            height: _size.height * 0.05,
                            padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.1,
                            ),
                            child: Center(
                              child: LinearProgressIndicator(),
                            ),
                          );
                        if (index < movies.length) {
                          final element = movies[index];
                          return MovieGridCard(
                            imagePath: element.posterPath,
                            title: element.title,
                            date: element.releaseDate.year != 0
                                ? "${element.releaseDate.day} de ${DateFormat.MMMM('es').format(element.releaseDate).toString()} del ${element.releaseDate.year}"
                                : '',
                          );
                        }
                        return Container();
                      },
                    );
                  }
                },
              ),
            );
        },
      ),
    );
  }
}
