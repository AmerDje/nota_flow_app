import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  go(Widget widget, RouteSettings settings) {
    Navigator.push(
        this,
        MaterialPageRoute(
            builder: (_) {
              return widget;
            },
            settings: settings));
  }
}
