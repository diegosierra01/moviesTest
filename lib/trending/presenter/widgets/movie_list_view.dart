import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const MovieListView({
    Key? key,
    required this.length,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(_size.width * 0.005),
      ),
      padding: EdgeInsets.symmetric(horizontal: _size.height * 0.01),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: length,
      cacheExtent: 5,
      itemBuilder: itemBuilder,
    );
  }
}
