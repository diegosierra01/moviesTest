import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/trending/presenter/info_media_state.dart';
import 'package:moviestest/trending/presenter/filters_presenter.dart';
import 'package:moviestest/trending/presenter/info_media_presenter.dart';
import 'package:moviestest/trending/presenter/media_layout_presenter.dart';
import 'package:moviestest/trending/presenter/media_layout_state.dart';
import 'package:moviestest/trending/ui/widgets/trending_grid_card.dart';
import 'package:moviestest/trending/ui/widgets/trending_grid_view.dart';
import 'package:moviestest/trending/ui/widgets/trending_list_card.dart';
import 'package:moviestest/trending/ui/widgets/trending_list_view.dart';
import 'package:provider/provider.dart';

class MovieStructure extends StatelessWidget {
  const MovieStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _infoMediaPresenter = Provider.of<InfoMediaPresenter>(context);
    final _layoutPresenter = Provider.of<MoviesLayoutPresenter>(context);
    final _filtersPresenter =
        Provider.of<FiltersPresenter>(context, listen: false);
    final mediaElements = _infoMediaPresenter.getMediaList;
    return SizedBox(
      height: _size.height * 0.75,
      child: _infoMediaPresenter.getMediaState == MediaState.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.extentAfter == 0) {
                  _infoMediaPresenter
                      .loadAdditionalData(_filtersPresenter.getMediaType);
                  return true;
                }
                return false;
              },
              child: _layoutPresenter.getMovieLayout == MediaLayoutState.list
                  ? TrendingListView(
                      length: (mediaElements.length) + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (_infoMediaPresenter
                            .requireProgressIndicator(index)) {
                          return SizedBox(
                            height: _size.height * 0.1,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (index < mediaElements.length) {
                          final element = mediaElements[index];
                          return TrendingListCard(
                            imagePath: element.posterPath,
                            iconData: element.getIcon,
                            title: element.title,
                            date: element.getDefaultDateFormat,
                          );
                        }
                        return Container();
                      },
                    )
                  : TrendingGridView(
                      length: (mediaElements.length) + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (_infoMediaPresenter
                            .requireProgressIndicator(index)) {
                          return Container(
                            height: _size.height * 0.05,
                            padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.1,
                            ),
                            child: const Center(
                              child: LinearProgressIndicator(),
                            ),
                          );
                        }
                        if (index < mediaElements.length) {
                          final element = mediaElements[index];
                          return TrendingGridCard(
                            textCornerDecoration: element.getLabel,
                            colorCornerDecoration: element.getLabelColor,
                            imagePath: element.posterPath,
                            title: element.title,
                            subtitle: element.getDefaultDateFormat,
                          );
                        }
                        return Container();
                      },
                    ),
            ),
    );
  }
}
