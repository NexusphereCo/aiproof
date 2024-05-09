import 'package:aiproof/modules/camera/index.dart';
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
  static const camera = '/camera';
  static const input = '/input';

  // Map that associates route names with their corresponding screen widgets.
  static final Map<String, Widget Function()> routesMap = {
    home: () => const HomeScreen(),
    input: () => const InputScreen(),
    camera: () => const CameraScreen(),
  };

  // Map that associates route names with their corresponding builder functions.
  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    input: (BuildContext context) => const InputScreen(),
    camera: (BuildContext context) => const CameraScreen(),
  };
}

/// Creates a custom page route for navigation.
///
/// The [createRoute] function is used to generate a custom page route for
/// navigation. It takes a [route] parameter, which represents the
/// name of the route to navigate to. It first checks if the [route] has
/// a corresponding builder function in the [Routes.routesMap]. If a builder
/// function is found, it creates a [PageRouteBuilder] with a custom animation
/// effect using [SlideTransition].
///
/// The animation starts from the right (1.0, 0.0) and moves to the left (0.0),
/// applying a smoothing curve for the transition effect.
///
/// If the [route] is not found in the [Routes.routesMap], it throws an
/// exception with the message "Invalid route. Cannot create route!".
///
/// Example:
///
/// ```dart
/// Navigator.of(context).push(createRoute('/dashboard'));
/// ```
Route createRoute({required String route, Object? args}) {
  // Get the builder function for the given destination.
  // refer to the above variable for routesMap.
  final destinationBuilder = Routes.routesMap[route];

  // Check if the builder function is found.
  if (destinationBuilder != null) {
    // Create a PageRouteBuilder with a custom animation effect.
    return PageRouteBuilder(
      // The page builder function is used to build the destination widget.
      pageBuilder: (context, animation, secondaryAnimation) => destinationBuilder(),
      settings: RouteSettings(name: route, arguments: args),
      // The transitionsBuilder is used to define the transition animation.
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define the start and end positions of the animation.
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;

        // Define a smoothing curve for the animation.
        const curve = Curves.ease;

        // Create a tween for the animation.
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // Apply a SlideTransition with the animation and child widget.
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // If destination is not found, throw an exception.
  throw Exception("Invalid route. Cannot create route!");
}
