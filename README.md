# 📋 Flutter Todo App

A clean and simple Todo app built with Flutter and Riverpod, demonstrating SOLID principles, theme switching, and local persistence.

![screenshot_light](screenshots/todo_light.png)
![screenshot_dark](screenshots/todo_dark.png)

---

## ✨ Features

- 📝 Add / delete / toggle todos
- 📆 Set and sort by due dates
- 📊 Stats page with charts
- 🎨 Light / dark theme switching
- 💾 Local storage using SharedPreferences
- 💡 Clean architecture using SOLID principles

---

## 📂 Project Structure

lib/ ├── main.dart # Entry point of the app ├── model/ # Data models (e.g., Todo) │ └── todo.dart ├── repositories/ # Interfaces and implementations for data access │ ├── todo_repository.dart │ └── i_todo_repository.dart ├── services/ # Business logic (uses repository interfaces) │ └── todo_service.dart ├── theme/ # Theme management using Riverpod │ └── theme_provider.dart ├── ui/ # UI layer (widgets and pages) │ ├── main_scaffold.dart │ ├── pages/ │ │ ├── todo_page.dart │ │ ├── stats_page.dart │ │ └── settings_page.dart │ └── widgets/ │ ├── todo_tile.dart │ └── add_todo_form.dart

> 📌 This structure reflects clean architecture principles: separation of concerns, easy testing, and scalability.
