import 'package:flutter/material.dart';
import 'package:todolist/services/todo_service.dart';

class StatsPage extends StatelessWidget {
  final TodoService service;

  const StatsPage({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    final todos = service.getTodos();
    final done = todos.where((t) => t.isDone).length;
    final total = todos.length;

    return Scaffold(
      appBar: AppBar(title: const Text('통계')),
      body: Center(
        child: Text(
          '완료: $done / 전체: $total',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
