import 'package:flutter/material.dart';
import 'package:flutter_app_notepad/core/database_helper.dart';
import 'package:flutter_app_notepad/views/add_note_view.dart';
import 'package:flutter_app_notepad/views/widgets/note_widget.dart';
import 'package:sqlite_wrapper/sqlite_wrapper.dart';
import '../core/models/task.dart';

class HomeView extends StatelessWidget {
  final tasks = DatabaseHelper().getTasks();
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
      body: SafeArea(
          child: Center(
              child: StreamBuilder(
                  initialData: const [],
                  stream: tasks,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final List<Task> todos = List<Task>.from(snapshot.data);
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = todos[index];
                        return NoteWidget(task);
                      },
                    );
                  }))),
    );
  }
}
