import 'dart:developer';

class TimeConverter {
  String timeConvert(int time) {
    String convertedTime = '';
    int hour = Duration(seconds: time).inHours.remainder(60);
    int min = Duration(seconds: time).inMinutes.remainder(60);
    if (hour.toString() == '0') {
      return convertedTime = '${min.toString()}m';
    } else {
      return convertedTime = '${hour.toString()}h ${min.toString()}m';
    }
  }
}
