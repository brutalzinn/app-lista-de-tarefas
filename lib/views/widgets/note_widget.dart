import 'package:flutter/material.dart';
import 'package:flutter_app_notepad/core/database_helper.dart';
import 'package:flutter_app_notepad/core/utils/datetime_conversion.dart';
import 'package:flutter_app_notepad/core/utils/widget_status_utils.dart';
import 'package:flutter_app_notepad/views/add_note_view.dart';
import 'package:flutter_app_notepad/views/edit_note_view.dart';

import '../../core/models/task.dart';

class NoteWidget extends StatelessWidget {
  final Task task;
  const NoteWidget(this.task, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(
            task.id.toString(),
            style: const TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(
            task.title,
            style: const TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(
            task.description.length > 5
                ? "${task.description.substring(5, task.description.length)}..."
                : task.description,
            style: const TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(
            task.priority.toString(),
            style: const TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Icon(WidgetStatusUtils.obterIconeStatus(task.status))),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(DateTimeUtils.toFormatDate(task.atualizadoEm))),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: Text(DateTimeUtils.toFormatDate(task.criadoEm))),
      Container(
        padding: const EdgeInsets.all(4.0),
        width: 100.0,
        child: TextButton(
            onPressed: () => DatabaseHelper().toggleDone(task),
            child: const Text("Concluído/Pendente")),
      ),
      Container(
        padding: const EdgeInsets.all(4.0),
        width: 100.0,
        child: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditNoteView(task: task))),
            icon: const Icon(Icons.edit)),
      ),
      Container(
        padding: const EdgeInsets.all(4.0),
        width: 100.0,
        child: IconButton(
            onPressed: () => DatabaseHelper().deleteTask(task),
            icon: const Icon(Icons.delete)),
      )
    ]);
  }
}
