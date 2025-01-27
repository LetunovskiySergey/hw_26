import 'package:flutter/material.dart';
import 'package:hw_26/models/task.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _taskController = TextEditingController();

  List<Task> tasks = [
    Task(title: 'Купить продукты'),
    Task(title: 'Позвонить на работу'),
    Task(title: 'Сходить в спортзал'),
    Task(title: 'Прочитать книгу'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список задач'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
