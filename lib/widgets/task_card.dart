import 'package:flutter/material.dart';
import 'package:hw_26/helpers/format_daretime.dart';
import 'package:hw_26/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;
  final VoidCallback onDelete;

  const TaskCard(
      {super.key,
      required this.task,
      required this.onComplete,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = task.completedDate != null
        ? Colors.grey
        : theme.textTheme.bodyLarge!.color;
    final decoration = task.completedDate != null
        ? TextDecoration.lineThrough
        : TextDecoration.none;
    final deadlineColor = task.completedDate == null
        ? theme.colorScheme.primary
        : task.completedDate!.isBefore(task.deadline)
            ? Colors.green
            : Colors.red;

    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(color: textColor, decoration: decoration),
        ),
        subtitle: Text(
          'Deadline: ${formatDateTime(task.deadline)}',
          style: TextStyle(color: deadlineColor),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: onComplete,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
