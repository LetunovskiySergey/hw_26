class Task {
  final String title;
  final DateTime deadline;
  final DateTime? completedDate;

  Task({
    required this.title,
    required this.deadline,
    this.completedDate,
  });

  Task copyWith({String? title, DateTime? deadline, DateTime? completedDate}) {
    return Task(
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      completedDate: completedDate ?? this.completedDate,
    );
  }
}
