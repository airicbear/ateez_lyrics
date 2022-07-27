import 'package:flutter/material.dart';

class PageTransition {
  static PageRouteBuilder to(Widget nextPage) {
    return PageRouteBuilder<void>(pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: const Interval(
                0.0,
                1.0,
                curve: Curves.fastOutSlowIn,
              ).transform(animation.value),
              child: nextPage,
            );
          });
    });
  }
}
