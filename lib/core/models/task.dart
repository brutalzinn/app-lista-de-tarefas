// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  int? id;
  int priority;
  String title;
  String description;
  String text;
  int done;
  Task({
    this.id,
    required this.priority,
    required this.title,
    required this.description,
    required this.text,
    required this.done,
  });

  Task copyWith({
    int? id,
    int? priority,
    String? title,
    String? description,
    String? text,
    int? done,
  }) {
    return Task(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      description: description ?? this.description,
      text: text ?? this.text,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'priority': priority,
      'title': title,
      'description': description,
      'text': text,
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      priority: map['priority'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      text: map['text'] as String,
      done: map['done'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, priority: $priority, title: $title, description: $description, text: $text, done: $done)';
  }
}
