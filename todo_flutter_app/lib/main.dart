import 'package:flutter/material.dart';
import 'package:todo_flutter_app/home_page.dart';
import 'package:todo_flutter_app/login_page.dart';
import 'package:todo_flutter_app/app_route_path.dart';
import 'package:todo_flutter_app/router_provider.dart';
import 'package:todo_flutter_app/signup_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouterDelegate = AppRouterDelegateImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Your App Name',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routerDelegate: _appRouterDelegate,
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

class AppRouterDelegateImpl extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final _currentConfiguration =
      ValueNotifier<AppRoutePath>(AppRoutePath.home());

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _currentConfiguration.value = configuration;
    notifyListeners();
  }

  @override
  AppRoutePath get currentConfiguration => _currentConfiguration.value;

  @override
  Widget build(BuildContext context) {
    return AppRouterDelegate(
      currentConfiguration: _currentConfiguration,
      onConfigurationChanged: (newConfiguration) {
        _currentConfiguration.value = newConfiguration;
        notifyListeners();
      },
    );
  }
}

class AppRouterDelegate extends StatefulWidget {
  final ValueNotifier<AppRoutePath> currentConfiguration;
  final Function(AppRoutePath) onConfigurationChanged;

  const AppRouterDelegate({
    super.key,
    required this.currentConfiguration,
    required this.onConfigurationChanged,
  });

  @override
  AppRouterDelegateState createState() => AppRouterDelegateState();
}

class AppRouterDelegateState extends State<AppRouterDelegate> {
  late List<AppRoutePath> _routeStack;

  @override
  void initState() {
    super.initState();
    _routeStack = [widget.currentConfiguration.value];
    widget.currentConfiguration.addListener(_handleConfigurationChange);
  }

  @override
  void dispose() {
    widget.currentConfiguration.removeListener(_handleConfigurationChange);
    super.dispose();
  }

  void _handleConfigurationChange() {
    setNewRoutePath(widget.currentConfiguration.value);
  }

  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    setState(() {
      if (configuration.isLoginPage) {
        _routeStack = [AppRoutePath.home(), configuration];
      } else if (configuration.isSignupPage) {
        _routeStack = [AppRoutePath.home(), configuration];
      } else {
        _routeStack = [configuration];
      }
    });
    widget.onConfigurationChanged(_routeStack.last);
  }

  @override
  Widget build(BuildContext context) {
    return RouterProvider(
      pushRoute: _pushRoute,
      replaceRoute: _replaceRoute,
      popToHome: _popToHome,
      child: Navigator(
        pages: [
          const MaterialPage(
            key: ValueKey('HomePage'),
            child: HomePage(),
          ),
          if (_routeStack.length > 1)
            if (_routeStack[1].isLoginPage)
              const MaterialPage(
                key: ValueKey('LoginPage'),
                child: LoginPage(),
              )
            else if (_routeStack[1].isSignupPage)
              const MaterialPage(
                key: ValueKey('SignupPage'),
                child: SignupPage(),
              ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          _popRoute();
          return true;
        },
      ),
    );
  }

  void _pushRoute(AppRoutePath path) {
    setState(() {
      _routeStack.add(path);
    });
    widget.onConfigurationChanged(_routeStack.last);
  }

  void _popRoute() {
    if (_routeStack.length > 1) {
      setState(() {
        _routeStack.removeLast();
      });
      widget.onConfigurationChanged(_routeStack.last);
    }
  }

  void _replaceRoute(AppRoutePath path) {
    setState(() {
      if (_routeStack.isNotEmpty) {
        _routeStack.last = path;
      } else {
        _routeStack.add(path);
      }
    });
    widget.onConfigurationChanged(_routeStack.last);
  }

  void _popToHome() {
    setState(() {
      _routeStack = [AppRoutePath.home()];
    });
    widget.onConfigurationChanged(_routeStack.last);
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }

    switch (uri.pathSegments[0]) {
      case 'login':
        return AppRoutePath.login();
      case 'signup':
        return AppRoutePath.signup();
      default:
        return AppRoutePath.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (configuration.isLoginPage) {
      return RouteInformation(uri: Uri.parse('/login'));
    }
    if (configuration.isSignupPage) {
      return RouteInformation(uri: Uri.parse('/signup'));
    }
    return null;
  }
}
