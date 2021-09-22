import 'package:flutter/material.dart';
import 'package:moviestest/trending/data/models/media_type.dart';
import 'package:moviestest/trending/domain/media_types.dart';
import 'package:moviestest/trending/presenter/filters_presenter.dart';
import 'package:provider/provider.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _filtersPresenter = Provider.of<FiltersPresenter>(context);
    return InputDecorator(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<MediaType>(
          onChanged: (trendingType) =>
              _filtersPresenter.setMediaType = trendingType!,
          value: _filtersPresenter.getMediaType,
          items: MediaTypes.mainList.map<DropdownMenuItem<MediaType>>(
            (MediaType mediaType) {
              return DropdownMenuItem(
                value: mediaType,
                child: Text(mediaType.labelSpanish),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
