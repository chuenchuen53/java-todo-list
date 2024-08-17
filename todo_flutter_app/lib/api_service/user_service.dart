import 'dart:convert';
import 'package:todo_flutter_app/api_modal/user_models.dart';
import 'package:todo_flutter_app/api_service/api_helper.dart';

class UserApi {
  static Future<bool> isLogin() async {
    final response = await Api.wrappedFetch("login", ApiMethod.GET);
    final data = IsLoginResp.fromJson(jsonDecode(response.body));
    return data.isLogin;
  }

  static Future<bool> login(String username, String password) async {
    final loginReq = LoginReq(username: username, password: password);
    final response = await Api.wrappedFetch("login", ApiMethod.POST, body: loginReq.toJson());
    final resp = LoginResp.fromJson(jsonDecode(response.body));
    return resp.success;
  }

  static Future<void> logout() async {
    await Api.wrappedFetch("logout", ApiMethod.POST);
  }

  static Future<String> signup(String username, String password, String confirmPassword) async {
    final signupReq = SignupReq(
      username: username,
      password: password,
      confirmPassword: confirmPassword,
    );
    final response = await Api.wrappedFetch("signup", ApiMethod.POST, body: signupReq.toJson());
    final data = SignupResp.fromJson(jsonDecode(response.body));
    return data.message;
  }
}
