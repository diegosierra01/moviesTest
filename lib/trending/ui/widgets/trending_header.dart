import 'package:flutter/material.dart';
import 'package:moviestest/trending/ui/widgets/trending_controls.dart';

class TrendingHeader extends StatelessWidget {
  const TrendingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Text(
              'Tendencias de la semana',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const TrendingControls()
        ],
      ),
    );
  }
}
