import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/dashboard/dashboard.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => DashBoard(
              // title: Strings.homeScreenTitle,
              ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
