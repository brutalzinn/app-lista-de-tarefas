import 'package:flutter/material.dart';
import 'package:flutter_app_notepad/core/database_helper.dart';
import 'package:flutter_app_notepad/views/add_note_view.dart';
import 'package:flutter_app_notepad/views/edit_note_view.dart';

import '../../core/models/task.dart';

class NoteWidget extends StatelessWidget {
  final Task task;
  const NoteWidget(this.task, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(task.title),
      Text(task.description.substring(0, task.description.length)),
      Text(task.priority.toString()),
      Icon(task.done == 1 ? Icons.done : Icons.pending),
      TextButton(
          onPressed: () => DatabaseHelper().toggleDone(task),
          child: const Text("Mudar status")),
      IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditNoteView(task: task))),
          icon: const Icon(Icons.edit)),
      IconButton(
          onPressed: () => DatabaseHelper().deleteTask(task),
          icon: const Icon(Icons.delete))
    ]);
  }
}
