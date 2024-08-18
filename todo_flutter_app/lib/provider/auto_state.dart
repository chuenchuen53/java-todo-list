import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_flutter_app/api_service/user_service.dart';

part 'auto_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      bool loginSuccess = await UserApi.login(username, password);
      if (loginSuccess) {
        state = const AsyncValue.data(true);
      } else {
        state = const AsyncValue.data(false);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await UserApi.logout();
      state = const AsyncValue.data(false);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  @override
  FutureOr<bool> build() async {
    return await UserApi.isLogin();
  }
}
