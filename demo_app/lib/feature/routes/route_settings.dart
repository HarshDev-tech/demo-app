
import 'package:demo_app/feature/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class DemoAppRouteSettings {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case NamedRoutes.home:
        return MaterialPageRoute(builder: (context) => MainPage());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(child: Text("No route defined for $routeName"))));
    }
  }
}

class NamedRoutes {
  static const String home = "/";
}
