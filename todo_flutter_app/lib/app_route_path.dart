class AppRoutePath {
  final String _path;

  AppRoutePath.home() : _path = '/';
  AppRoutePath.login() : _path = '/login';
  AppRoutePath.signup() : _path = '/signup';

  bool get isHomePage => _path == '/';
  bool get isLoginPage => _path == '/login';
  bool get isSignupPage => _path == '/signup';
}
