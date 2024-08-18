import 'package:flutter/material.dart';
import 'package:todo_flutter_app/app_route_path.dart';

class RouterProvider extends InheritedWidget {
  final List<AppRoutePath> Function() getCurrentRouteStack;
  final Function(AppRoutePath) pushRoute;
  final Function(AppRoutePath) replaceRoute;
  final VoidCallback popToHome;
  final Function(Object, Function(AppRoutePath)) onRouteChange;
  final Function(Object) removeRouteChangeListener;

  const RouterProvider({
    super.key,
    required this.getCurrentRouteStack,
    required this.pushRoute,
    required this.replaceRoute,
    required this.popToHome,
    required this.onRouteChange,
    required this.removeRouteChangeListener,
    required super.child,
  });

  static RouterProvider of(BuildContext context) {
    final RouterProvider? result = context.dependOnInheritedWidgetOfExactType<RouterProvider>();
    assert(result != null, 'No RouterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RouterProvider oldWidget) {
    return getCurrentRouteStack() != oldWidget.getCurrentRouteStack() ||
        pushRoute != oldWidget.pushRoute ||
        replaceRoute != oldWidget.replaceRoute ||
        popToHome != oldWidget.popToHome ||
        onRouteChange != oldWidget.onRouteChange ||
        removeRouteChangeListener != oldWidget.removeRouteChangeListener;
  }
}
