import 'package:flutter/material.dart';
import 'package:moviestest/errors/error_injection.dart';
import 'package:moviestest/trending/presenter/trending_injection.dart';

class TrendingListPage extends StatelessWidget {
  const TrendingListPage({Key? key}) : super(key: key);

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
        child: TrendingInjection.injection(),
      ),
    );
  }
}
