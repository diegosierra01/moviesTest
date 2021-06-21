import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/error_dialog.dart';
import 'package:moviestest/movie/presenter/movie_bloc.dart';
import 'package:moviestest/movie/presenter/widgets/movie_structure.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Peliculas La Haus',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _bloc.error,
        builder: (BuildContext context, error, Widget? child) {
          if (error is! NoError) {
            String _message;
            Icon _icon;
            if (error is InternetError) {
              _message = '';
              _icon = Icon(Icons.power_off_outlined);
            } else if (error is ServerError) {
              _message =
                  'En este momento no se puede conectar con el servidor.';
              _icon = Icon(Icons.cloud_off);
            } else {
              _message = 'Oops';
              _icon = Icon(Icons.error_outline);
            }
            WidgetsBinding.instance!
              ..addObserver(this)
              ..addPostFrameCallback(
                (_) {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) => ErrorDialog(
                      icon: _icon,
                      message: _message,
                    ),
                  ).then<void>((value) {});
                  _bloc.error.value = NoError();
                },
              );
          }
          return Container(
            color: Color(0xffeeeeee),
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
                      ValueListenableBuilder(
                        valueListenable: _bloc.setup,
                        builder: (BuildContext context, setup, Widget? child) {
                          return ButtonBar(
                            children: [
                              TextButton(
                                child: Icon(Icons.grid_view_rounded),
                                onPressed: () => _bloc.setup.value = 'grid',
                                style: ButtonStyle(
                                  shape: setup == 'grid'
                                      ? MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              _size.width * 0.02,
                                            ),
                                            side: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                              TextButton(
                                child: Icon(Icons.view_list_rounded),
                                onPressed: () => _bloc.setup.value = 'list',
                                style: ButtonStyle(
                                  shape: setup == 'list'
                                      ? MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              _size.width * 0.02,
                                            ),
                                            side: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                MovieStructure()
              ],
            ),
          );
        },
      ),
    );
  }
}
