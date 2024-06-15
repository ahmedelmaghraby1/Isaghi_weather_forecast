import 'package:isaghi/core/injection/injector.dart';

class DateTimeFormatters {
  static String dateParsing(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateFormat.format(dateTime)} - ${timeFormat.format(dateTime)}';
  }
}
