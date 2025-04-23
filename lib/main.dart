import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/ui/main_scaffold.dart';
import 'repositories/todo_repository.dart';
import 'services/todo_service.dart';
import 'theme/theme_provider.dart'; // 추가

void main() {
  final repo = TodoRepository();
  final service = TodoService(repo, repo);

  runApp(
    ProviderScope(
      child: MyApp(service: service),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final TodoService service;

  const MyApp({required this.service, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider); // 테마 상태 감시

    return MaterialApp(
      title: 'Todo App',
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MainScaffold(service: service),
    );
  }
}
