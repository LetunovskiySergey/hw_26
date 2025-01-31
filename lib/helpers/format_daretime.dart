String formatDateTime(DateTime dateTime) {
  return '${dateTime.day}.${dateTime.month}.${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
}

String formatDate(DateTime dateTime) {
  return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
}
