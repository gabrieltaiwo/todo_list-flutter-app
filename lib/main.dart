import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
//import 'package:todo_list/screens/tasks_screen.dart';
import 'screens/authentication_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: AuthenticationScreen(),
        //TasksScreen(),
      ),
    );
  }
}
