/// 获取年，输出格式“2006”
String dbGetYear() {
  var date = DateTime.now();
  var dateString = '${date.year.toString()}';
  return dateString;
}

/// 获取月，输出格式“01”
String dbGetMonth() {
  var date = DateTime.now();
  var dateString = '${date.month.toString()}';
  return dateString;
}

/// 获取日，输出格式“02”
String dbGetDay() {
  var date = DateTime.now();
  var dateString = '${date.day.toString()}';
  return dateString;
}

/// 获取时，输出格式“15”
String dbGetHour() {
  var date = DateTime.now();
  var dateString = '${date.hour.toString()}';
  return dateString;
}

/// 获取分，输出格式“04”
String dbGetMinute() {
  var date = DateTime.now();
  var dateString = '${date.minute.toString()}';
  return dateString;
}

/// 获取秒，输出格式“05”
String dbGetSecond() {
  var date = DateTime.now();
  var dateString = '${date.second.toString()}';
  return dateString;
}

/// 获取年月日，输出格式“2006-01-02”
String dbGetYearMonthDay() {
  var date = DateTime.now();
  var dateString =
      '${date.year.toString()}-${date.month.toString()}-${date.day.toString()}';
  return dateString;
}

/// 获取时分秒，输出格式“15:04:05”
String dbGetHourMinuteSecond() {
  var date = DateTime.now();
  var dateString =
      '${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';
  return dateString;
}

/// 获取年月日时分秒，输出格式“2006-01-02 15:04:05”
String dbGetYearMonthDayHourMinuteSecond() {
  var date = DateTime.now();
  var dateString =
      '${date.year.toString()}-${date.month.toString()}-${date.day.toString()} ${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';
  return dateString;
}
