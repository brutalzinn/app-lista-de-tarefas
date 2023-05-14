import 'package:flutter/material.dart';
import 'package:flutter_app_notepad/core/database_helper.dart';
import 'package:flutter_app_notepad/views/add_note_view.dart';
import 'package:flutter_app_notepad/views/widgets/note_widget.dart';
import '../core/models/task.dart';
import 'widgets/header_widget.dart';

class HomeView extends StatelessWidget {
  final tasks = DatabaseHelper().getTasksByPriorityAndStatus();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNoteView()))
        },
        child: const Text("Add"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40.0, child: HeaderWidget()),
          Expanded(
              child: StreamBuilder(
                  initialData: const [],
                  stream: tasks,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final List<Task> listTasks = List<Task>.from(snapshot.data);
                    return ListView.builder(
                      itemCount: listTasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = listTasks[index];
                        return NoteWidget(task);
                      },
                    );
                  })),
        ],
      ),
    );
  }
}
