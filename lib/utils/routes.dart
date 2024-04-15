import 'package:aiproof/modules/home/index.dart';
import 'package:aiproof/modules/input/index.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  // Splash screen
  static const String splash = '/splash';
  // --------------------------------------------------------------------------------------
  // Homepage related
  // --------------------------------------------------------------------------------------
  static const home = '/home';
  static const input = '/input';

  // Map that associates route names with their corresponding screen widgets.
  static final Map<String, Widget Function()> routesMap = {
    home: () => const HomeScreen(),
    input: () => const InputScreen(),
  };

  // Map that associates route names with their corresponding builder functions.
  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    input: (BuildContext context) => const InputScreen(),
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
