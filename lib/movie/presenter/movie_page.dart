import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/movie/presenter/movie_bloc.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _bloc.state,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Text('Trending of the week'),
                ),
              ),
              Container(
                  height: _size.height * 0.8,
                  child: value == States.Loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo is ScrollEndNotification &&
                                scrollInfo.metrics.extentAfter == 0) {
                              _bloc.loadData();
                              return true;
                            }
                            return false;
                          },
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            padding: EdgeInsets.only(top: 20),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: _bloc.getMovies.length,
                            cacheExtent: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(_bloc.getMovies[index].title);
                            },
                          ),
                        )),
              value == States.AdditionalLoading
                  ? CircularProgressIndicator()
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
