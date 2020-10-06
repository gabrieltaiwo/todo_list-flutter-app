import 'package:flutter/material.dart';
//import 'screens/tasks_screen.dart';
import 'screens/authentication_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthenticationScreen()
        //TasksScreen(),
        );
  }
}
