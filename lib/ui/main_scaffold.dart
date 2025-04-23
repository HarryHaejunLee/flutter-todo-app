import 'package:flutter/material.dart';
import '../services/todo_service.dart';
import 'pages/todo_page.dart';
import 'pages/stats_page.dart';
import 'pages/settings_page.dart';

class MainScaffold extends StatefulWidget {
  final TodoService service;

  const MainScaffold({required this.service, super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      TodoPage(service: widget.service),
      StatsPage(service: widget.service),
      SettingsPage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
