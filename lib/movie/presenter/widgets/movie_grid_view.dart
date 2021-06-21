import 'package:flutter/cupertino.dart';

class MovieGridView extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const MovieGridView({
    Key? key,
    required this.length,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6.0 / 9.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
      cacheExtent: 5,
      itemCount: length,
      itemBuilder: itemBuilder,
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
