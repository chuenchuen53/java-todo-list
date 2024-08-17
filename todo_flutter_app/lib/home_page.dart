import 'package:flutter/material.dart';
import 'package:todo_flutter_app/api_service/user_service.dart';
import 'package:todo_flutter_app/app_route_path.dart';
import 'package:todo_flutter_app/router_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      final isLoggedIn = await UserApi.isLogin();
      setState(() {
        _isLoggedIn = isLoggedIn;
      });
    } catch (e) {
      print('Error checking login status: $e');
      setState(() {
        _isLoggedIn = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLoggedIn == null
                  ? 'Checking login status...'
                  : _isLoggedIn!
                      ? 'You are logged in'
                      : 'You are not logged in',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => RouterProvider.of(context).pushRoute(AppRoutePath.signup()),
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => RouterProvider.of(context).pushRoute(AppRoutePath.login()),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _checkLoginStatus(); // Refresh login status
              },
              child: const Text('Refresh Login Status'),
            ),
          ],
        ),
      ),
    );
  }
}
