import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/error/error_injection.dart';
import 'package:moviestest/trending/presenter/movie_injection.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Peliculas IMDb',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
      body: ErrorInjection.injection(
        child: MovieInjection.injection(),
      ),
    );
  }
}
