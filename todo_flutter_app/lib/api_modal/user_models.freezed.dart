// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsLoginResp _$IsLoginRespFromJson(Map<String, dynamic> json) {
  return _IsLoginResp.fromJson(json);
}

/// @nodoc
mixin _$IsLoginResp {
  bool get isLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsLoginRespCopyWith<IsLoginResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsLoginRespCopyWith<$Res> {
  factory $IsLoginRespCopyWith(
          IsLoginResp value, $Res Function(IsLoginResp) then) =
      _$IsLoginRespCopyWithImpl<$Res, IsLoginResp>;
  @useResult
  $Res call({bool isLogin});
}

/// @nodoc
class _$IsLoginRespCopyWithImpl<$Res, $Val extends IsLoginResp>
    implements $IsLoginRespCopyWith<$Res> {
  _$IsLoginRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
  }) {
    return _then(_value.copyWith(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsLoginRespImplCopyWith<$Res>
    implements $IsLoginRespCopyWith<$Res> {
  factory _$$IsLoginRespImplCopyWith(
          _$IsLoginRespImpl value, $Res Function(_$IsLoginRespImpl) then) =
      __$$IsLoginRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLogin});
}

/// @nodoc
class __$$IsLoginRespImplCopyWithImpl<$Res>
    extends _$IsLoginRespCopyWithImpl<$Res, _$IsLoginRespImpl>
    implements _$$IsLoginRespImplCopyWith<$Res> {
  __$$IsLoginRespImplCopyWithImpl(
      _$IsLoginRespImpl _value, $Res Function(_$IsLoginRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
  }) {
    return _then(_$IsLoginRespImpl(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IsLoginRespImpl implements _IsLoginResp {
  const _$IsLoginRespImpl({required this.isLogin});

  factory _$IsLoginRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsLoginRespImplFromJson(json);

  @override
  final bool isLogin;

  @override
  String toString() {
    return 'IsLoginResp(isLogin: $isLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoginRespImpl &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoginRespImplCopyWith<_$IsLoginRespImpl> get copyWith =>
      __$$IsLoginRespImplCopyWithImpl<_$IsLoginRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsLoginRespImplToJson(
      this,
    );
  }
}

abstract class _IsLoginResp implements IsLoginResp {
  const factory _IsLoginResp({required final bool isLogin}) = _$IsLoginRespImpl;

  factory _IsLoginResp.fromJson(Map<String, dynamic> json) =
      _$IsLoginRespImpl.fromJson;

  @override
  bool get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$IsLoginRespImplCopyWith<_$IsLoginRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) {
  return _LoginReq.fromJson(json);
}

/// @nodoc
mixin _$LoginReq {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginReqCopyWith<LoginReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginReqCopyWith<$Res> {
  factory $LoginReqCopyWith(LoginReq value, $Res Function(LoginReq) then) =
      _$LoginReqCopyWithImpl<$Res, LoginReq>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginReqCopyWithImpl<$Res, $Val extends LoginReq>
    implements $LoginReqCopyWith<$Res> {
  _$LoginReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginReqImplCopyWith<$Res>
    implements $LoginReqCopyWith<$Res> {
  factory _$$LoginReqImplCopyWith(
          _$LoginReqImpl value, $Res Function(_$LoginReqImpl) then) =
      __$$LoginReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginReqImplCopyWithImpl<$Res>
    extends _$LoginReqCopyWithImpl<$Res, _$LoginReqImpl>
    implements _$$LoginReqImplCopyWith<$Res> {
  __$$LoginReqImplCopyWithImpl(
      _$LoginReqImpl _value, $Res Function(_$LoginReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginReqImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginReqImpl implements _LoginReq {
  const _$LoginReqImpl({required this.username, required this.password});

  factory _$LoginReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginReqImplFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginReq(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginReqImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginReqImplCopyWith<_$LoginReqImpl> get copyWith =>
      __$$LoginReqImplCopyWithImpl<_$LoginReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginReqImplToJson(
      this,
    );
  }
}

abstract class _LoginReq implements LoginReq {
  const factory _LoginReq(
      {required final String username,
      required final String password}) = _$LoginReqImpl;

  factory _LoginReq.fromJson(Map<String, dynamic> json) =
      _$LoginReqImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginReqImplCopyWith<_$LoginReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return _LoginResp.fromJson(json);
}

/// @nodoc
mixin _$LoginResp {
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRespCopyWith<LoginResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRespCopyWith<$Res> {
  factory $LoginRespCopyWith(LoginResp value, $Res Function(LoginResp) then) =
      _$LoginRespCopyWithImpl<$Res, LoginResp>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$LoginRespCopyWithImpl<$Res, $Val extends LoginResp>
    implements $LoginRespCopyWith<$Res> {
  _$LoginRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRespImplCopyWith<$Res>
    implements $LoginRespCopyWith<$Res> {
  factory _$$LoginRespImplCopyWith(
          _$LoginRespImpl value, $Res Function(_$LoginRespImpl) then) =
      __$$LoginRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$LoginRespImplCopyWithImpl<$Res>
    extends _$LoginRespCopyWithImpl<$Res, _$LoginRespImpl>
    implements _$$LoginRespImplCopyWith<$Res> {
  __$$LoginRespImplCopyWithImpl(
      _$LoginRespImpl _value, $Res Function(_$LoginRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$LoginRespImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRespImpl implements _LoginResp {
  const _$LoginRespImpl({required this.success});

  factory _$LoginRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRespImplFromJson(json);

  @override
  final bool success;

  @override
  String toString() {
    return 'LoginResp(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRespImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRespImplCopyWith<_$LoginRespImpl> get copyWith =>
      __$$LoginRespImplCopyWithImpl<_$LoginRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRespImplToJson(
      this,
    );
  }
}

abstract class _LoginResp implements LoginResp {
  const factory _LoginResp({required final bool success}) = _$LoginRespImpl;

  factory _LoginResp.fromJson(Map<String, dynamic> json) =
      _$LoginRespImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$LoginRespImplCopyWith<_$LoginRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupReq _$SignupReqFromJson(Map<String, dynamic> json) {
  return _SignupReq.fromJson(json);
}

/// @nodoc
mixin _$SignupReq {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupReqCopyWith<SignupReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupReqCopyWith<$Res> {
  factory $SignupReqCopyWith(SignupReq value, $Res Function(SignupReq) then) =
      _$SignupReqCopyWithImpl<$Res, SignupReq>;
  @useResult
  $Res call({String username, String password, String confirmPassword});
}

/// @nodoc
class _$SignupReqCopyWithImpl<$Res, $Val extends SignupReq>
    implements $SignupReqCopyWith<$Res> {
  _$SignupReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupReqImplCopyWith<$Res>
    implements $SignupReqCopyWith<$Res> {
  factory _$$SignupReqImplCopyWith(
          _$SignupReqImpl value, $Res Function(_$SignupReqImpl) then) =
      __$$SignupReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String confirmPassword});
}

/// @nodoc
class __$$SignupReqImplCopyWithImpl<$Res>
    extends _$SignupReqCopyWithImpl<$Res, _$SignupReqImpl>
    implements _$$SignupReqImplCopyWith<$Res> {
  __$$SignupReqImplCopyWithImpl(
      _$SignupReqImpl _value, $Res Function(_$SignupReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$SignupReqImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupReqImpl implements _SignupReq {
  const _$SignupReqImpl(
      {required this.username,
      required this.password,
      required this.confirmPassword});

  factory _$SignupReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupReqImplFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'SignupReq(username: $username, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupReqImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupReqImplCopyWith<_$SignupReqImpl> get copyWith =>
      __$$SignupReqImplCopyWithImpl<_$SignupReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupReqImplToJson(
      this,
    );
  }
}

abstract class _SignupReq implements SignupReq {
  const factory _SignupReq(
      {required final String username,
      required final String password,
      required final String confirmPassword}) = _$SignupReqImpl;

  factory _SignupReq.fromJson(Map<String, dynamic> json) =
      _$SignupReqImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$SignupReqImplCopyWith<_$SignupReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupResp _$SignupRespFromJson(Map<String, dynamic> json) {
  return _SignupResp.fromJson(json);
}

/// @nodoc
mixin _$SignupResp {
// "success" | "Username is already registered"
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupRespCopyWith<SignupResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupRespCopyWith<$Res> {
  factory $SignupRespCopyWith(
          SignupResp value, $Res Function(SignupResp) then) =
      _$SignupRespCopyWithImpl<$Res, SignupResp>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SignupRespCopyWithImpl<$Res, $Val extends SignupResp>
    implements $SignupRespCopyWith<$Res> {
  _$SignupRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupRespImplCopyWith<$Res>
    implements $SignupRespCopyWith<$Res> {
  factory _$$SignupRespImplCopyWith(
          _$SignupRespImpl value, $Res Function(_$SignupRespImpl) then) =
      __$$SignupRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignupRespImplCopyWithImpl<$Res>
    extends _$SignupRespCopyWithImpl<$Res, _$SignupRespImpl>
    implements _$$SignupRespImplCopyWith<$Res> {
  __$$SignupRespImplCopyWithImpl(
      _$SignupRespImpl _value, $Res Function(_$SignupRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignupRespImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupRespImpl implements _SignupResp {
  const _$SignupRespImpl({required this.message});

  factory _$SignupRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupRespImplFromJson(json);

// "success" | "Username is already registered"
  @override
  final String message;

  @override
  String toString() {
    return 'SignupResp(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupRespImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupRespImplCopyWith<_$SignupRespImpl> get copyWith =>
      __$$SignupRespImplCopyWithImpl<_$SignupRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupRespImplToJson(
      this,
    );
  }
}

abstract class _SignupResp implements SignupResp {
  const factory _SignupResp({required final String message}) = _$SignupRespImpl;

  factory _SignupResp.fromJson(Map<String, dynamic> json) =
      _$SignupRespImpl.fromJson;

  @override // "success" | "Username is already registered"
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SignupRespImplCopyWith<_$SignupRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
