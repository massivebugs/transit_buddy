import 'package:intl/intl.dart';

String forHumans(DateTime toFormat) {
  final formatter = DateFormat("yyyy-MM-dd HH:mm");
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final toCompare = DateTime(toFormat.year, toFormat.month, toFormat.day);
  if (toCompare == today) {
    return '${toFormat.hour}:${toFormat.minute}';
  } else if (toCompare == tomorrow) {
    return '明日 ${toFormat.hour}:${toFormat.minute}';
  } else if (toCompare == yesterday) {
    return '先日 ${toFormat.hour}:${toFormat.minute}';
  }
  return formatter.format(toFormat);
}

String format(DateTime toFormat) {
  final formatter = DateFormat("yyyy-MM-dd HH:mm");
  return formatter.format(toFormat);
}
