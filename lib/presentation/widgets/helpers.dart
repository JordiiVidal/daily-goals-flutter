import 'package:intl/intl.dart';

class Formatter {
  static String db(DateTime datetime, {bool time = false}) => (!time)
      ? DateFormat('yyyy-MM-dd').format(datetime)
      : DateFormat('yyyy-MM-dd HH:mm').format(datetime);
  static String ui(DateTime datetime, {bool time = false}) => (!time)
      ? DateFormat('yMMMEd').format(datetime)
      : DateFormat('HH:mm').format(datetime);

  static String momentDay() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12 && timeNow >= 6) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
