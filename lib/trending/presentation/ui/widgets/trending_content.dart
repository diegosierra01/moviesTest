import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/trending/presentation/ui/widgets/trending_header.dart';
import 'package:moviestest/trending/presentation/ui/widgets/trending_structure.dart';

class MoviesContent extends StatelessWidget {
  const MoviesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeeeeee),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          TrendingHeader(),
          MovieStructure(),
        ],
      ),
    );
  }
}
