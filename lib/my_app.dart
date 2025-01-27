import 'package:flutter/material.dart';
import 'package:hw_26/screens/todo_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.blueGrey.shade100,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade100,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.shade200,
        ),
      ),
      home: TodoListScreen(),
    );
  }
}
