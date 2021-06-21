import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final Icon icon;

  const ErrorDialog({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: _size.width * 0.8,
        padding: EdgeInsets.all(_size.height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height * 0.2,
              child: FittedBox(
                child: icon,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: _size.height * 0.1,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
