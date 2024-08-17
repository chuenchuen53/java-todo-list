import 'package:flutter/material.dart';
import 'package:todo_flutter_app/app_route_path.dart';

class RouterProvider extends InheritedWidget {
  final Function(AppRoutePath) pushRoute;
  final Function(AppRoutePath) replaceRoute;
  final VoidCallback popToHome;

  const RouterProvider({
    super.key,
    required this.pushRoute,
    required this.replaceRoute,
    required this.popToHome,
    required super.child,
  });

  static RouterProvider of(BuildContext context) {
    final RouterProvider? result =
        context.dependOnInheritedWidgetOfExactType<RouterProvider>();
    assert(result != null, 'No RouterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RouterProvider oldWidget) {
    return pushRoute != oldWidget.pushRoute ||
        replaceRoute != oldWidget.replaceRoute;
  }
}
