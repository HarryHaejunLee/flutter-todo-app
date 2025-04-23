import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/todo.dart';
import '../interfaces/todo_read_repository_interface.dart';
import '../interfaces/todo_write_repository_interface.dart';

class TodoRepository implements ITodoReadRepository, ITodoWriteRepository {
  List<Todo> _todos = [];

  @override
  List<Todo> getTodos() => _todos;

  @override
  void addTodo(Todo todo) {
    _todos.add(todo);
    saveToLocal();
  }

  @override
  void deleteTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    saveToLocal();
  }

  @override
  void toggleTodo(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      final todo = _todos[index];
      _todos[index] = todo.copyWith(isDone: !todo.isDone);
      saveToLocal();
    }
  }

  @override
  Future<void> loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('todos');
    if (jsonString != null) {
      final List list = json.decode(jsonString);
      _todos = list.map((e) => Todo.fromJson(e)).toList();
    }
  }

  @override
  Future<void> saveToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(_todos.map((t) => t.toJson()).toList());
    await prefs.setString('todos', jsonString);
  }
}
