import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_models.freezed.dart';
part 'todo_models.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String description,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
