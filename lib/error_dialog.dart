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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(_size.width * 0.1),
            color: Colors.white,
            height: _size.height * 0.5,
            width: _size.width * 0.8,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _size.height * 0.25,
                  child: FittedBox(
                    child: icon,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.04,
                  backgroundColor: Colors.black,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
