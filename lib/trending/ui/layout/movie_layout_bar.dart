import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/media_layout_state.dart';
import 'package:moviestest/trending/presenter/media_layout_presenter.dart';
import 'package:provider/provider.dart';

class MovieLayoutBar extends StatelessWidget {
  const MovieLayoutBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _layoutPresenter = Provider.of<MoviesLayoutPresenter>(context);
    return ButtonBar(
      children: [
        TextButton(
          onPressed: () =>
              _layoutPresenter.setMovieLayout = MediaLayoutState.grid,
          style: ButtonStyle(
            shape: _layoutPresenter.getMovieLayout == MediaLayoutState.grid
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
          onPressed: () =>
              _layoutPresenter.setMovieLayout = MediaLayoutState.list,
          style: ButtonStyle(
            shape: _layoutPresenter.getMovieLayout == MediaLayoutState.list
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
    );
  }
}
