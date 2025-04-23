import '../models/todo.dart';

abstract class ITodoReadRepository {
  List<Todo> getTodos();
  Future<void> loadFromLocal();
}
