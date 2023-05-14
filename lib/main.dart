import 'package:flutter/material.dart';
import 'package:flutter_app_notepad/core/models/task.dart';
import 'package:flutter_app_notepad/views/home_view.dart';

import 'core/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDatabase();
  runApp(MaterialApp(
    color: Colors.black,
    title: 'Navigation Basics',
    home: HomeView(),
  ));
}
