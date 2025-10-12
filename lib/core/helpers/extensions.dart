import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  //used in other class context.pushNamed(Routes.loginScreen instead of Navigator.of(context).pushNamed(Routes.loginScreen);
  //this = context du widget.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  ///this: Refers to the String object itself
  /// String? name = ""; // This is NOT null (it exists)
  /// String? age = null; // This IS null (doesn't exist)
  bool isNullOrEmpty() => this == null || this == "";
}
