import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/layout/movie_layout_type.dart';
import 'package:moviestest/trending/presenter/layout/movies_layout_presenter.dart';
import 'package:moviestest/trending/presenter/widgets/movie_structure.dart';
import 'package:provider/provider.dart';

class MoviesContent extends StatelessWidget {
  const MoviesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _layoutPresenter = Provider.of<MoviesLayoutPresenter>(context);
    final _size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xffeeeeee),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: _size.width * 0.05),
                    child: Text(
                      'Tendencias de la semana',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () => _layoutPresenter.setMovieLayout =
                          MovieLayoutType.grid,
                      style: ButtonStyle(
                        shape: _layoutPresenter.getMovieLayout ==
                                MovieLayoutType.grid
                            ? MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    _size.width * 0.02,
                                  ),
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      child: const Icon(Icons.grid_view_rounded),
                    ),
                    TextButton(
                      onPressed: () => _layoutPresenter.setMovieLayout =
                          MovieLayoutType.list,
                      style: ButtonStyle(
                        shape: _layoutPresenter.getMovieLayout ==
                                MovieLayoutType.list
                            ? MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    _size.width * 0.02,
                                  ),
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      child: const Icon(Icons.view_list_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const MovieStructure()
        ],
      ),
    );
  }
}
