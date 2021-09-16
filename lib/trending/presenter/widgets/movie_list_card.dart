import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/widgets/image_detail.dart';

class MovieListCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;

  const MovieListCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_size.width * 0.02),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: _size.width * 0.2,
            height: _size.height * 0.15,
            child: Hero(
              tag: imagePath,
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetail(
                          url: imagePath,
                        ),
                      ),
                    );
                  },
                  child: FadeInImage(
                    fadeOutDuration: const Duration(milliseconds: 400),
                    fadeInDuration: const Duration(milliseconds: 400),
                    placeholder:
                        const AssetImage('assets/images/ic_launcher.png'),
                    image: NetworkImage(
                      imagePath,
                    ),
                    fit: BoxFit.fill,
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
                    date,
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
