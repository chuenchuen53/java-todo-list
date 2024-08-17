import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class IsLoginResp with _$IsLoginResp {
  const factory IsLoginResp({
    required bool isLogin,
  }) = _IsLoginResp;

  factory IsLoginResp.fromJson(Map<String, dynamic> json) => _$IsLoginRespFromJson(json);
}

@freezed
class LoginReq with _$LoginReq {
  const factory LoginReq({
    required String username,
    required String password,
  }) = _LoginReq;

  factory LoginReq.fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);
}

@freezed
class LoginResp with _$LoginResp {
  const factory LoginResp({
    required bool success,
  }) = _LoginResp;

  factory LoginResp.fromJson(Map<String, dynamic> json) => _$LoginRespFromJson(json);
}

@freezed
class SignupReq with _$SignupReq {
  const factory SignupReq({
    required String username,
    required String password,
    required String confirmPassword,
  }) = _SignupReq;

  factory SignupReq.fromJson(Map<String, dynamic> json) => _$SignupReqFromJson(json);
}

@freezed
class SignupResp with _$SignupResp {
  const factory SignupResp({
    // "success" | "Username is already registered"
    required String message,
  }) = _SignupResp;

  factory SignupResp.fromJson(Map<String, dynamic> json) => _$SignupRespFromJson(json);
}
