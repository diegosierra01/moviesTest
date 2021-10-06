import 'package:flutter/material.dart';
import 'package:moviestest/trending/presentation/ui/filters/filters_widget.dart';
import 'package:moviestest/trending/presentation/ui/layout/movie_layout_bar.dart';

class TrendingControls extends StatelessWidget {
  const TrendingControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: _size.width * 0.03,
            ),
            child: const FiltersWidget(),
          ),
        ),
        const MovieLayoutBar(),
      ],
    );
  }
}
