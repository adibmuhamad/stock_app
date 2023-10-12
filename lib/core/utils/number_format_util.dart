import 'package:intl/intl.dart';

class NumberFormatUtil {
  static String formatDecimal(double value, {int decimalDigits = 2}) {
    final format = NumberFormat.decimalPattern();
    format.minimumFractionDigits = decimalDigits;
    format.maximumFractionDigits = decimalDigits;
    return format.format(value);
  }

  static String formatCompact(double value, {int decimalDigits = 2}) {
    final format = NumberFormat.compact();
    format.minimumFractionDigits = decimalDigits;
    format.maximumFractionDigits = decimalDigits;
    return format.format(value);
  }

  static String formatChange(double value, {int decimalDigits = 2}) {
    final format = NumberFormat.decimalPattern();
    format.minimumFractionDigits = decimalDigits;
    format.maximumFractionDigits = decimalDigits;
    return (value > 0 ? '+' : '') + format.format(value);
  }
}
