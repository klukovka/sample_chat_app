import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static DateTime fromJson(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  static int toJson(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  String get formatTime => DateFormat('HH:mm').format(this);
}
