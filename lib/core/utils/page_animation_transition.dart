import 'package:flutter/material.dart';

Route createRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // animation = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
      // return ScaleTransition(
      //   alignment: Alignment.center,
      //   scale: animation,
      //   child: child,
      // );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class PageTransitionAnimation extends PageRouteBuilder {
  final Widget widget;
  PageTransitionAnimation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            });
}
