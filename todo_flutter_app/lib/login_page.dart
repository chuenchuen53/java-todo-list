import 'package:flutter/material.dart';
import 'package:todo_flutter_app/api_service/user_service.dart';
import 'package:todo_flutter_app/app_route_path.dart';
import 'package:todo_flutter_app/router_provider.dart';
import 'package:todo_flutter_app/util.dart';
import 'package:todo_flutter_app/widgets/aligned_right_text_button.dart';
import 'package:todo_flutter_app/widgets/styled_submit_button.dart';
import 'package:todo_flutter_app/widgets/styled_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String _errorMsg = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _errorMsg = '';
      });

      try {
        bool loginSuccess = await UserApi.login(_usernameController.text, _passwordController.text);

        if (loginSuccess) {
          RouterProvider.of(context).popToHome();
        } else {
          setState(() {
            _errorMsg = 'Username or password is incorrect';
          });
        }
      } catch (e) {
        setState(() {
          _errorMsg = 'An error occurred. Please try again.';
        });
      } finally {
        if (mounted) {
          setState(() {
            _loading = false;
          });
        }
      }
    }
  }

  void _goSignupPage(BuildContext context) {
    RouterProvider.of(context).replaceRoute(AppRoutePath.signup());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 375,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                StyledTextFormField(
                  controller: _usernameController,
                  hintText: 'Username',
                  validator: (value) => nonEmptyAlphanumeric(value, 'username'),
                ),
                const SizedBox(height: 8),
                StyledTextFormField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSubmit(),
                  validator: (value) => nonEmptyAlphanumeric(value, 'password'),
                ),
                const SizedBox(height: 8),
                StyledSubmitButton(
                  buttonText: 'Login',
                  onPressed: _handleSubmit,
                  loading: _loading,
                  errorMsg: _errorMsg,
                ),
                AlignedRightTextButton(
                  text: 'Go signup',
                  onPressed: () => _goSignupPage(context),
                  disabled: _loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
