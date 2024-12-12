import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTime(
      {required DateTime dateTime, String format = 'd MM yyyy'}) {
    return DateFormat(format, 'id').format(dateTime);
  }

  static String formatDateTimeFromString(
      {required String dateTimeString, String format = 'd MM yyyy'}) {
    if (dateTimeString.isEmpty) {
      return ''; // Mengembalikan kosong jika string kosong
    }
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat(format, 'id').format(dateTime);
  }
}
