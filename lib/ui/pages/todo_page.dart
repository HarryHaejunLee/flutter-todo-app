import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/services/todo_service.dart';

class TodoPage extends StatefulWidget {
  final TodoService service;
  const TodoPage({required this.service, super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool _sortByDueDate = false;

  void _showAddDialog() {
    final controller = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('새 Todo 추가'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: controller, decoration: const InputDecoration(labelText: '할 일')),
            TextButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(selectedDate == null ? '마감일 선택' : DateFormat('yyyy-MM-dd').format(selectedDate!)),
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() => selectedDate = picked);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.service.addTodo(controller.text, selectedDate);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todos = widget.service.getTodos(sortedByDueDate: _sortByDueDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          Row(
            children: [
              const Text('정렬'),
              Switch(
                value: _sortByDueDate,
                onChanged: (v) => setState(() => _sortByDueDate = v),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: todos.map((t) {
          final dueText = t.dueDate != null ? DateFormat('yyyy-MM-dd').format(t.dueDate!) : '마감일 없음';
          return ListTile(
            title: Text(t.title),
            subtitle: Text(dueText),
            trailing: Checkbox(
              value: t.isDone,
              onChanged: (_) {
                widget.service.toggleTodo(t.id);
                setState(() {});
              },
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
