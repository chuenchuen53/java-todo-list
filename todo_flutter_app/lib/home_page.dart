import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter_app/api_modal/todo_models.dart';
import 'package:todo_flutter_app/app_route_path.dart';
import 'package:todo_flutter_app/provider/auto_state.dart';
import 'package:todo_flutter_app/provider/todo_state.dart';
import 'package:todo_flutter_app/router_provider.dart';
import 'package:todo_flutter_app/widgets/input_group_with_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedInAsync = ref.watch(authStateProvider);

    return isLoggedInAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      data: (isLoggedIn) {
        if (!isLoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final router = RouterProvider.of(context);
            final currentPath = router.getCurrentRouteStack();

            if (currentPath.length == 1 && currentPath[0].isHomePage) {
              router.pushRoute(AppRoutePath.login());
            }
          });
          return Container();
        }
        return const _TodoContent();
      },
    );
  }
}

class _TodoContent extends ConsumerStatefulWidget {
  const _TodoContent();

  @override
  _TodoContentState createState() => _TodoContentState();
}

class _TodoContentState extends ConsumerState<_TodoContent> {
  late TextEditingController _newTodoController;

  @override
  void initState() {
    super.initState();
    _newTodoController = TextEditingController();
  }

  @override
  void dispose() {
    _newTodoController.dispose();
    super.dispose();
  }

  bool _validateTodoDescription(String value) {
    if (value.trim().isEmpty || value.length > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Todo description must be between 1 and 100 characters"),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final todoStateAsync = ref.watch(todoStateProvider);
    final todoState = ref.read(todoStateProvider.notifier);
    final isAddingTodo = ref.watch(isAddingTodoProvider);

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (_) => false,
        title: const Text('Todo List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: OutlinedButton(
              onPressed: () async {
                await ref.read(authStateProvider.notifier).logout();
                if (context.mounted) {
                  RouterProvider.of(context).pushRoute(AppRoutePath.login());
                }
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 768),
              child: Column(
                children: [
                  InputGroupWithButton(
                    controller: _newTodoController,
                    onSubmit: () {
                      final description = _newTodoController.text;
                      if (_validateTodoDescription(description)) {
                        todoState.addTodo(description);
                        _newTodoController.clear();
                      }
                    },
                    isLoading: isAddingTodo,
                    hintText: 'What do you need to do',
                    buttonText: 'Add',
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: todoStateAsync.when(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(child: Text('Error: $error')),
                      data: (todos) => TodoList(
                        todos: todos,
                        handleToggleTodoStatus: todoState.toggleTodoStatus,
                        handleEditTodoClick: (todo) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return UpdateTodoModal(
                                id: todo.id,
                                description: todo.description,
                                onCanceled: () => Navigator.of(context).pop(),
                                onSubmit: (id, description) {
                                  if (_validateTodoDescription(description)) {
                                    todoState.updateTodoDescription(id, description);
                                    Navigator.of(context).pop();
                                  }
                                },
                              );
                            },
                          );
                        },
                        handleDeleteTodo: todoState.deleteTodo,
                        onRefresh: todoState.refreshTodos,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DraggableScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo) handleToggleTodoStatus;
  final Function(Todo) handleEditTodoClick;
  final Function(int) handleDeleteTodo;
  final Future<void> Function() onRefresh;

  const TodoList({
    super.key,
    required this.todos,
    required this.handleToggleTodoStatus,
    required this.handleEditTodoClick,
    required this.handleDeleteTodo,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: ScrollConfiguration(
        behavior: DraggableScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: todos.isEmpty
              ? ListView(
                  children: const [
                    SizedBox(height: 100),
                    Center(child: Text('No todos yet')),
                  ],
                )
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[todos.length - index - 1];
                    return ListTile(
                      key: ValueKey(todo.id),
                      leading: Checkbox(
                        value: todo.completed,
                        onChanged: (bool? value) {
                          if (value != null) {
                            handleToggleTodoStatus(todo);
                          }
                        },
                      ),
                      title: Text(
                        todo.description,
                        style: TextStyle(
                          decoration: todo.completed ? TextDecoration.lineThrough : null,
                          color: todo.completed ? Theme.of(context).colorScheme.onSurface.withAlpha(80) : null,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => handleEditTodoClick(todo),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => handleDeleteTodo(todo.id),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class UpdateTodoModal extends StatefulWidget {
  final int id;
  final String description;
  final Function() onCanceled;
  final Function(int, String) onSubmit;

  const UpdateTodoModal({
    super.key,
    required this.id,
    required this.description,
    required this.onCanceled,
    required this.onSubmit,
  });

  @override
  UpdateTodoModalState createState() => UpdateTodoModalState();
}

class UpdateTodoModalState extends State<UpdateTodoModal> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double dialogWidth = min(768 - 48, constraints.maxWidth - 48);

        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(24),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          title: Stack(
            children: [
              Positioned(
                top: 12,
                right: 24,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onCanceled,
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Update todo'),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: dialogWidth,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              onSubmitted: (value) => widget.onSubmit(widget.id, value),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => widget.onSubmit(widget.id, _controller.text),
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
