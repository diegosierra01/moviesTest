import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ImageDetail extends StatelessWidget {
  final String url;
  const ImageDetail({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    timeDilation = 5.0;
    return Hero(
      tag: url,
      child: Material(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: _size.height, maxWidth: _size.width),
          color: Colors.white,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.network(
                url,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
