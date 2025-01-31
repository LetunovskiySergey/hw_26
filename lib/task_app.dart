import 'package:flutter/material.dart';
import 'package:hw_26/models/task.dart';
import 'package:hw_26/widgets/new_task.dart';
import 'package:hw_26/widgets/task_card.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  List<Task> tasks = [];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks[index] = tasks[index].copyWith(
        completedDate: DateTime.now(),
      );
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void openAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onTaskCreated: addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          IconButton(onPressed: openAddTaskSheet, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            task: tasks[index],
            onComplete: () => completeTask(index),
            onDelete: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
