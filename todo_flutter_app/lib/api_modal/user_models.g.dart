// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsLoginRespImpl _$$IsLoginRespImplFromJson(Map<String, dynamic> json) =>
    _$IsLoginRespImpl(
      isLogin: json['isLogin'] as bool,
    );

Map<String, dynamic> _$$IsLoginRespImplToJson(_$IsLoginRespImpl instance) =>
    <String, dynamic>{
      'isLogin': instance.isLogin,
    };

_$LoginReqImpl _$$LoginReqImplFromJson(Map<String, dynamic> json) =>
    _$LoginReqImpl(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginReqImplToJson(_$LoginReqImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

_$LoginRespImpl _$$LoginRespImplFromJson(Map<String, dynamic> json) =>
    _$LoginRespImpl(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$LoginRespImplToJson(_$LoginRespImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

_$SignupReqImpl _$$SignupReqImplFromJson(Map<String, dynamic> json) =>
    _$SignupReqImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$SignupReqImplToJson(_$SignupReqImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };

_$SignupRespImpl _$$SignupRespImplFromJson(Map<String, dynamic> json) =>
    _$SignupRespImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$SignupRespImplToJson(_$SignupRespImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
