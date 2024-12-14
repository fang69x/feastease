import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the MovieTween for the animation
    final movieTween = MovieTween()
      ..tween("opacity", Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween("translateY", Tween(begin: -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      tween: movieTween, // The animation
      duration: movieTween.duration, // Mandatory duration
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation.get<double>("opacity"),
          child: Transform.translate(
            offset: Offset(0, animation.get<double>("translateY")),
            child: child,
          ),
        );
      },
      child: child, // Pass the child widget
    );
  }
}
