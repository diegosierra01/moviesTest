import 'package:flutter/material.dart';
import 'package:moviestest/routes.dart';

import 'package:moviestest/constants/colors.dart';

enum Status { none, running, stopped, paused }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas IMDb',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.primary[500]!.value,
          AppColors.primary,
        ),
      ),
      onGenerateRoute: (settings) =>
          Routes.instance!.getRoutes[settings.name]!(settings.arguments),
    );
  }
}
