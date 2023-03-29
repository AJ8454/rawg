import 'package:flutter/material.dart';

class AppNavigator {
  static push(BuildContext context, String route) =>
      Navigator.pushNamed(context, route);

  static pushWithData(BuildContext context, String route, dynamic data) =>
      Navigator.pushNamed(context, route, arguments: data);

  static pop(BuildContext context) => Navigator.pop(context);

  static pushReplace(BuildContext context, String route) =>
      Navigator.pushNamedAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
}
