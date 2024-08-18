import 'dart:convert';
import 'package:todo_flutter_app/api_modal/todo_models.dart';
import 'package:todo_flutter_app/api_service/api_helper.dart';

class TodoApi {
  static const String url = "todo";

  static Future<List<Todo>> getTodos() async {
    final response = await Api.wrappedFetch(url, ApiMethod.GET);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<Todo> insertTodo(String description) async {
    final response = await Api.wrappedFetch(
      url,
      ApiMethod.POST,
      body: {'description': description},
    );
    return Todo.fromJson(json.decode(response.body));
  }

  static Future<String> _updateTodo(Map<String, dynamic> body) async {
    await Api.wrappedFetch(url, ApiMethod.PUT, body: body);
    return "success";
  }

  static Future<String> updateTodoDescription(int id, String description) async {
    return _updateTodo({'id': id, 'description': description});
  }

  static Future<String> updateTodoStatus(int id, bool completed) async {
    return _updateTodo({'id': id, 'completed': completed});
  }

  static Future<String> deleteTodo(int id) async {
    await Api.wrappedFetch("$url?todoId=$id", ApiMethod.DELETE);
    return "success";
  }
}
