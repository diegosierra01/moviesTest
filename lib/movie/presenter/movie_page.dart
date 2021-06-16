import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/movie/presenter/movie_bloc.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Container(
        height: _size.height,
        child: Column(
          children: [
            Text('Trending of the week - Movies'),
            ValueListenableBuilder(
              valueListenable: _bloc.state,
              builder: (context, value, child) {
                if (value == States.Busy) {
                  return CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView(
                      children: _bloc.getMovies
                          .map(
                            (movie) => Text(movie.title),
                          )
                          .toList(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
