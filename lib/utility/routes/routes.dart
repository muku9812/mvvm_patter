import 'package:flutter/material.dart';
import 'package:mvvm_practises/utility/routes/routesName.dart';
import 'package:mvvm_practises/view/homeView.dart';
import 'package:mvvm_practises/view/loginView.dart';

import '../../view/splashView.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined."),
            ),
          );
        });
    }
  }
}
