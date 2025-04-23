import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../interfaces/todo_read_repository_interface.dart';
import '../interfaces/todo_write_repository_interface.dart';

class TodoService {
  final ITodoReadRepository readRepository;
  final ITodoWriteRepository writeRepository;

  TodoService(this.readRepository, this.writeRepository);

  List<Todo> getTodos({bool sortedByDueDate = false}) {
    final todos = readRepository.getTodos();
    if (sortedByDueDate) {
      todos.sort((a, b) {
        if (a.dueDate == null) return 1;
        if (b.dueDate == null) return -1;
        return a.dueDate!.compareTo(b.dueDate!);
      });
    }
    return todos;
  }

  void addTodo(String title, DateTime? dueDate) {
    final newTodo = Todo(
      id: UniqueKey().toString(),
      title: title,
      isDone: false,
      dueDate: dueDate,
    );

    writeRepository.addTodo(newTodo); // ✅ 레포지토리에게 추가 요청만 함
  }

  void deleteTodo(String id) {
    writeRepository.deleteTodo(id);
  }

  void toggleTodo(String id) {
    writeRepository.toggleTodo(id);
  }

  Future<void> loadTodos() async {
    await readRepository.loadFromLocal();
  }
}
