import 'package:intl/intl.dart';

class DateUtil {
  static String convertToString(DateTime date) {
    return DateFormat('yyyy, MMM dd').format(date);
  }

  static String chartFormat(double date) {
    return DateFormat('dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(date.toInt()));
  }
}
