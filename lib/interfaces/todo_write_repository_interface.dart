import '../models/todo.dart';

abstract class ITodoWriteRepository {
  void addTodo(Todo todo);
  void deleteTodo(String id);
  void toggleTodo(String id);
  Future<void> saveToLocal();
}
