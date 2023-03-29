import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rawg/src/app/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:rawg/src/app/features/authentication/presentation/pages/login_page.dart';
import 'package:rawg/src/app/features/authentication/presentation/pages/signup_page.dart';
import 'package:rawg/src/app/features/home/presentation/pages/home_page.dart';
import 'package:rawg/src/app/features/splash/presentation/pages/splash_page.dart';

class AppRoute {
  static Route<dynamic>? router(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    log("navigating ${settings.name}");
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (context) => const SplashPage());

      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case ForgetPasswordPage.route:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordPage());

      case SignUpPage.route:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case HomePage.route:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
    return null;
  }
}
