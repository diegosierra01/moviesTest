import 'package:flutter/material.dart';
import 'package:moviestest/movie/presenter/movie_injection.dart';
import 'package:moviestest/splash/splash.dart';

import 'constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas La Haus',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.primary[500]!.value,
          AppColors.primary,
        ),
      ),
      home: SplashPage(),
    );
  }
}
