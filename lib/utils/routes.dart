import 'package:ai_proof/modules/auth/screens/homepage.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  // static variable for homepage route
  static const String homepage = '/homepage';

  // Map that associates route names with their corresponding screen widgets.
  static final Map<String, Widget Function()> routesMap = {
    homepage: () => const HomePage(),
  };

  // Map that associates route names with their corresponding builder functions.
  static final routes = <String, WidgetBuilder>{
    homepage: (BuildContext context) => const HomePage(),
  };
}

// Function to create a custom page route for navigation.
Route createRoute({required String route, Object? args}) {
  final destinationBuilder = Routes.routesMap[route];

  if (destinationBuilder != null) {
    return MaterialPageRoute(
      builder: (context) => destinationBuilder(),
      settings: RouteSettings(name: route, arguments: args),
    );
  }

  throw Exception("Invalid route. Cannot create route!");
}
