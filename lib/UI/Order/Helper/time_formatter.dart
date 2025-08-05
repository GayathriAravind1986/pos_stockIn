import 'package:intl/intl.dart';

String formatTime(String? dateString) {
  if (dateString == null) return '--';
  try {
    final inputFormat = DateFormat('M/d/yyyy, h:mm:ss a');
    final dateTime = inputFormat.parse(dateString);
    return DateFormat.jm().format(dateTime);
  } catch (e) {
    return '--';
  }
}

String formatToApiDate(DateTime dateTime) {
  return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime.toUtc());
}
