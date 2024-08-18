import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_flutter_app/api_modal/todo_models.dart';
import 'package:todo_flutter_app/api_service/todo_service.dart';

part 'todo_state.g.dart';

@riverpod
class IsAddingTodo extends _$IsAddingTodo {
  @override
  bool build() {
    return false;
  }

  void setLoading(bool isLoading) {
    state = isLoading;
  }
}

@riverpod
class TodoState extends _$TodoState {
  Future<void> addTodo(String description) async {
    final isAddingTodoNotifier = ref.read(isAddingTodoProvider.notifier);
    isAddingTodoNotifier.setLoading(true);
    try {
      final newTodo = await TodoApi.insertTodo(description);
      state = AsyncValue.data([...state.value ?? [], newTodo]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isAddingTodoNotifier.setLoading(false);
    }
  }

  Future<void> toggleTodoStatus(Todo todo) async {
    try {
      await TodoApi.updateTodoStatus(todo.id, !todo.completed);
      state = AsyncValue.data(
          state.value?.map((t) => t.id == todo.id ? t.copyWith(completed: !t.completed) : t).toList() ?? []);
    } catch (e) {
      await refreshTodos();
    }
  }

  Future<void> updateTodoDescription(int todoId, String newDescription) async {
    try {
      await TodoApi.updateTodoDescription(todoId, newDescription);
      state = AsyncValue.data(
          state.value?.map((t) => t.id == todoId ? t.copyWith(description: newDescription) : t).toList() ?? []);
    } catch (e) {
      await refreshTodos();
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await TodoApi.deleteTodo(id);
      state = AsyncValue.data(state.value?.where((t) => t.id != id).toList() ?? []);
    } catch (e) {
      await refreshTodos();
    }
  }

  Future<void> refreshTodos() async {
    state = const AsyncValue.loading();
    try {
      final todos = await TodoApi.getTodos();
      state = AsyncValue.data(todos);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  @override
  FutureOr<List<Todo>> build() async {
    return await TodoApi.getTodos();
  }
}
