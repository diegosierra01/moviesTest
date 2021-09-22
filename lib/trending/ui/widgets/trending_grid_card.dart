import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moviestest/routes.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class TrendingGridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Color colorCornerDecoration;
  final String textCornerDecoration;

  const TrendingGridCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.colorCornerDecoration,
    required this.textCornerDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: imagePath,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.movieDetail,
                      arguments: imagePath);
                },
                child: Container(
                  foregroundDecoration: RotatedCornerDecoration(
                    color: colorCornerDecoration,
                    geometry: const BadgeGeometry(
                      width: 50,
                      height: 50,
                    ),
                    badgeShadow: const BadgeShadow(
                      color: Colors.black87,
                      elevation: 3.5,
                    ),
                    textSpan: TextSpan(
                      text: textCornerDecoration,
                      style: theme.textTheme.caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 12.0 / 11.0,
                    child: FadeInImage(
                      fadeOutDuration: const Duration(milliseconds: 400),
                      fadeInDuration: const Duration(milliseconds: 400),
                      placeholder:
                          const AssetImage('assets/images/ic_launcher.png'),
                      image: NetworkImage(
                        imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: theme.textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    subtitle,
                    style: theme.textTheme.overline,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
