import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviestest/movie/presenter/movie_injection.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween(begin: 10.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.5),
      ),
    );
    _animationController.forward();
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MovieInjection.injection()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.48,
                left: 0,
                right: 0,
                child: Transform.scale(
                  scale: _animation.value,
                  child: SvgPicture.asset(
                    'assets/images/logo-lahaus-full.svg',
                    color: Theme.of(context).primaryColor,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}