import 'package:intl/intl.dart';

class DateTimeUtils {
  static String toFormatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    String formattedDate =
        DateFormat('MM-dd-yyyy hh:mm').format(dateTime.toLocal());
    return formattedDate;
  }
}
