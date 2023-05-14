// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  int? id;
  int priority;
  String title;
  String description;
  String text;
  int status;
  DateTime criadoEm;
  DateTime? atualizadoEm;

  Task({
    this.id,
    required this.priority,
    required this.title,
    required this.description,
    required this.text,
    required this.status,
    required this.criadoEm,
    this.atualizadoEm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'priority': priority,
      'title': title,
      'description': description,
      'text': text,
      'status': status,
      'criadoEm': criadoEm.toString(),
      'atualizadoEm': atualizadoEm?.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      priority: map['priority'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      text: map['text'] as String,
      status: map['status'] as int,
      criadoEm: DateTime.parse(map['criadoEm']),
      atualizadoEm: map['atualizadoEm'] != null
          ? DateTime.parse(map['atualizadoEm'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, priority: $priority, title: $title, description: $description, text: $text, status: $status, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }
}
