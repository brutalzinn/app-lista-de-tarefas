import 'package:flutter/material.dart';
import 'package:sqlite_wrapper/sqlite_wrapper.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper _singleton = DatabaseHelper._internal();
  factory DatabaseHelper() {
    return _singleton;
  }
  DatabaseHelper._internal();

  initDatabase({inMemory = false}) async {
    String dbPath = inMemoryDatabasePath;
    if (!inMemory) {
      final docDir = await getApplicationDocumentsDirectory();
      if (!await docDir.exists()) {
        await docDir.create(recursive: true);
      }
      dbPath = p.join(docDir.path, "todoDatabase.sqlite");
    }
    final DatabaseInfo dbInfo =
        await SQLiteWrapper().openDB(dbPath, onCreate: () async {
      const String sql = """
		      CREATE TABLE IF NOT EXISTS "tasks" (
          "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
          "text" text NOT NULL,
          "title" text NOT NULL,
          "description" varchar(255) NOT NULL,
          "priority" int default 0,
          "status" int default 0,
          "criadoEm" text NOT NULL,
          "atualizadoEm" text default NULL
        );""";
      await SQLiteWrapper().execute(sql);
    });
    debugPrint("Database path: ${dbInfo.path}");
  }

  void addNewTask(Task task) async {
    await SQLiteWrapper().insert(task.toMap(), "tasks");
  }

  void updateTask(Task task) async {
    await SQLiteWrapper().update(task.toMap(), "tasks", keys: ["id"]);
  }

  void toggleDone(Task task) async {
    task.status = task.status == 0 ? 1 : 0;
    await SQLiteWrapper().update(task.toMap(), "tasks", keys: ["id"]);
  }

  void deleteTask(Task task) async {
    await SQLiteWrapper().delete(task.toMap(), "tasks", keys: ["id"]);
  }

  Stream getTasks() {
    return SQLiteWrapper()
        .watch("SELECT * FROM tasks", fromMap: Task.fromMap, tables: ["tasks"]);
  }

  Stream getTasksByPriorityAndStatus() {
    return SQLiteWrapper().watch(
        "SELECT * FROM tasks ORDER BY priority DESC, status DESC",
        fromMap: Task.fromMap,
        tables: ["tasks"]);
  }
}
