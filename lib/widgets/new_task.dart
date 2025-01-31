import 'package:flutter/material.dart';
import 'package:hw_26/helpers/format_date_time.dart';
import 'package:hw_26/models/task.dart';

class NewTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;

  const NewTask({super.key, required this.onTaskCreated});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var title = '';
  var selectedDate = DateTime.now().add(Duration(days: 1));
  final dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(selectedDate);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    final newTask = Task(title: title, deadline: selectedDate);
    widget.onTaskCreated(newTask);
    Navigator.pop(context);
  }

  void onDateTap() async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = now.add(Duration(days: 365));

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDate,
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) => setState(() => title = value),
            decoration: InputDecoration(label: Text('Title')),
          ),
          SizedBox(height: 16),
          TextField(
            onTap: onDateTap,
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(label: Text('Deadline')),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child:
                      TextButton(onPressed: onCanceled, child: Text('Cancel'))),
              SizedBox(width: 16),
              Expanded(
                  child:
                      ElevatedButton(onPressed: onSaved, child: Text('Save'))),
            ],
          )
        ],
      ),
    );
  }
}
