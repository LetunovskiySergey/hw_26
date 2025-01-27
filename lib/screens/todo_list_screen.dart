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

  void _addTask(String title) {
    if (title.isNotEmpty) {
      setState(() {
        tasks.add(Task(title: title));
      });
      _taskController.clear();
    }
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

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
                    decoration: InputDecoration(
                      hintText: 'Введите новую задачу',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addTask(_taskController.text),
                  child: Text('Добавить'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: task.isCompleted
                                ? Colors.grey
                                : Colors.indigo.shade500,
                          ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            task.isCompleted ? Icons.undo : Icons.check,
                            color:
                                task.isCompleted ? Colors.grey : Colors.green,
                          ),
                          onPressed: () => _toggleTaskStatus(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeTask(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
