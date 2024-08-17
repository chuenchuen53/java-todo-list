import 'package:flutter/material.dart';
import 'package:todo_flutter_app/api_service/user_service.dart';
import 'package:todo_flutter_app/app_route_path.dart';
import 'package:todo_flutter_app/router_provider.dart';
import 'package:todo_flutter_app/util.dart';
import 'package:todo_flutter_app/widgets/aligned_right_text_button.dart';
import 'package:todo_flutter_app/widgets/styled_submit_button.dart';
import 'package:todo_flutter_app/widgets/styled_text_form_field.dart';

typedef SuccessData = ({String username, String password});

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _loading = false;
  String _errorMsg = '';
  SuccessData? _successData;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _errorMsg = '';
      });

      try {
        String signupResult = await UserApi.signup(
          _usernameController.text,
          _passwordController.text,
          _confirmPasswordController.text,
        );

        if (signupResult == 'success') {
          setState(() {
            _successData = (
              username: _usernameController.text,
              password: _passwordController.text,
            );
          });
        } else {
          setState(() {
            _errorMsg = signupResult;
          });
        }
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  void _goLoginPage() {
    RouterProvider.of(context).replaceRoute(AppRoutePath.login());
  }

  Widget _buildSuccessDialog(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.black54,
          ),
        ),
        AlertDialog(
          title: const Text('Success Signup'),
          titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 24,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username: ${_successData!.username}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Password: ${_successData!.password}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: _goLoginPage,
              child: const Text('Go login'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 375,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Signup',
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
                      validator: (value) => nonEmptyAlphanumeric(value, 'password'),
                    ),
                    const SizedBox(height: 8),
                    StyledTextFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _handleSubmit(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    StyledSubmitButton(
                      buttonText: 'Signup',
                      onPressed: _handleSubmit,
                      loading: _loading,
                      errorMsg: _errorMsg,
                    ),
                    AlignedRightTextButton(
                      text: 'Go login',
                      onPressed: _goLoginPage,
                      disabled: _loading,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_successData != null)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // Prevent taps from reaching the background
                child: _buildSuccessDialog(context),
              ),
            ),
        ],
      ),
    );
  }
}
