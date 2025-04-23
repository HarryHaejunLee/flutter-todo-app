class Todo {
  final String id;
  final String title;
  final bool isDone;
  final DateTime? dueDate; // ✅ 추가됨

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
    this.dueDate,
  });

  Todo copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? dueDate,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'dueDate': dueDate?.toIso8601String(),
      };

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        isDone: json['isDone'],
        dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      );
}
