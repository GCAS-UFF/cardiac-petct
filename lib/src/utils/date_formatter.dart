import 'package:intl/intl.dart';

class DateFormatter {
  static String dateFormat(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM');
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }
}
