import 'package:flutter/material.dart';
import 'package:hw_26/models/task.dart';
import 'package:hw_26/widgets/task_card.dart';

class TaskScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(int index) onComplete;
  const TaskScreen({
    super.key,
    required this.tasks,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            task: tasks[index],
            onComplete: () => onComplete(index),
            onDelete: () {},
          );
        },
      ),
    );
  }
}
