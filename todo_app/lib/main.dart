import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:Home(),
    );
  }
}
